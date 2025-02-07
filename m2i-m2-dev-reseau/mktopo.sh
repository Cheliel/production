#!/bin/bash

liste=$1

declare -A rt
declare -a ether
let maxiface=0
let maxports=8

function attribip() {
    local network=$1
    local ipiface=0

    while read conn; do
        echo "$conn $network.$((ipiface+1))/30 $network.$((ipiface+2))/30"
        ipiface=$((ipiface+4))
    done
}

function findether() {
    local maxiface=$1
    local iface
    local conn
    local rt1
    local rt2

    while read conn; do
        let iface=maxiface
        rt1=${conn:0:2}
        rt2=${conn:3:2}
        if [[ ! -z ${ether[$iface]} ]]; then
            while [[ "${ether[$iface]}" != "${ether[$iface]//$rt1}" ]] || [[ "${ether[$iface]}" != "${ether[$iface]//$rt2}" ]]; do
                iface=$((iface-1))
                if [[ $iface -lt 0 ]]; then
                    echo No more interfaces >&2
                    exit 128
                fi
            done
        fi
        ether[$iface]="${ether[$iface]} $conn"
        echo "$conn ether${iface}"
    done
}

function connect() {
    local rt1
    local rt2
    local iface

    if [[ $# -eq 2 ]]; then

        echo "$1"-"$2"
    else
        rt1="$1"
        shift
        for rt2 in "$@"; do
            connect "$rt1" "$rt2"
        done
        connect "$@"
    fi
}

while read ip nom ports; do
    maxiface=$((maxiface++))
    rt["$ip"]="$nom"
    [[ $ports -gt $maxports ]] && macports=$ports
done <"$liste"

connect "${rt[@]}" | findether $maxports | attribip 10.10.10


