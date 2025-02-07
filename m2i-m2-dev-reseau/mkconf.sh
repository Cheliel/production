#!/bin/bash

liste=$1
conf=$2

iploc=10.255.255
ipmac=1

declare -A rtip
declare -A rt_iface_str

function help() {
    echo USAGE: $0 liste conf >&2
    exit 128
}

function set_iface_str () {
    local iface=$1

    shift

    while [[ ! -z $1 ]]; do
        rt_iface_str["$1"]="${rt_iface_str["$1"]},$iface"
        shift
    done
}

function set_iface_ip() {
    local rt=$1
    local iface=$2
    local ip=$3

    echo "/ip/address/add interface=$iface address=$ip">>/tmp/$rt
}
 function set_lo_ip() {
     local rt=$1
     local ip=$2

     echo "/ip/address/add interface=lo address=$ip" >/tmp/$rt
     echo "/routing/id/add name=$rt id=$ip" >>/tmp/$rt
 }

 function set_ospf() {
     local rt=$1
     echo "/routing/ospf/instance/add name=ospfv2 router-id=$rt redistribute=connected" >>/tmp/$rt
     echo "/routing/ospf/area/add area-id=0.0.0.0 instance=ospfv2 name=backbone" >>/tmp/$rt
     echo "/routing/ospf/interface-template/add area=backbone interfaces=${rt_iface_str[$rt]}" >>/tmp/$rt
 }


if [[ -z $1 ]] || [[ -z $2 ]]; then
    help
fi


while read ip nom ports; do
    rtip["$nom"]=$ip
    set_lo_ip $nom "$iploc.$ipmac/32"
    rt_iface_str[$nom]="lo"
    ipmac=$((ipmac+1))
done <$liste

while read conn iface ip1 ip2; do
    rt1=${conn:0:2}
    rt2=${conn:3:2}
    set_iface_str $iface $rt1 $rt2
    set_iface_ip $rt1 $iface $ip1
    set_iface_ip $rt2 $iface $ip2
done <$conf

for rt in ${!rtip[@]}; do
    set_ospf $rt
done
