# Mise en production 

## Introduction

Réseau social : le clan (-150 000 ans) :

- Utilisation de signe visuel et parfois verbal

Réseau d'irigation : mésopotamie  (-5000 ans)

- transporter l'eau d'un point à un autre
- règle technique à respecter 


Réseaux commercial : route de la soie (139 AV JC)

- réseau avec de multiple embronchement 
- on a le droit de perdre de l'info 

Réseau routier moderne : 

- routier 
- Férroviaire
- téléphonique 

> Dans l'exemple du réseau routier, c'est un métaphore du réseau internet. Pour commencer on est sur que ce n'est pas forcément le premier qui part qui arrivera en premier (chemin différents, flux différents, facteur humain). **Réseau router**.

> Dans l'exemple du réseau férroviaire, on lance une locomotive et elle suit un chemin. A partir du moment où on envoie le premier paquet tout les autres suivent le même tracé. C'est un réseau synchrone, typique d'un réseau téléphonique. **Réseau commuté**.


Aujourd'hui les choses on un peut changer puisqu'on s'est dit qu'il faudrait que nos réseau router soit commuté et inversement. C'est une révolution dans les data center : la 5G. Il est alors possible de faire passer de la visio conférence et du téléphone. 

## Histoire du réseaux informatique 

- 1792 les frère Chappe invente le télégraphe optique , il y a une volonté de relier Strasbourg et Paris. La raison d'exister d'un réseau c'est d'accélérer la vitesse
- 1836-1838 Edward Davy télégraphe 
- 1844 Samuel Morse met au point le... morse 
- 1958 BELL invente le premier modem capable de transmettre le première données binaire
- 1969 naissance d'ARPANET premier réseau de communication de paquet 
- 1972 première app de mail sur le réseau ARPANET 

>Internet n'est pas un réseau mais un ensemble de réseau. 


### Modèle OSI

| Layer | Name | Description/Function |
|-------|------|-------------------|
| 7 | Application | Interface directe avec l'utilisateur final (HTTP, FTP, SMTP, DNS) |
| 6 | Présentation | Formatage et chiffrement des données (ASCII, JPEG, encryption) |
| 5 | Session | Gestion des sessions entre applications (NetBIOS, RPC) |
| 4 | Transport | Fiabilité de bout en bout, contrôle de flux (TCP, UDP) |
| 3 | Réseau | Routage et adressage logique (IP, ICMP) |
| 2 | Liaison | Adressage physique et détection d'erreurs (Ethernet, WiFi) |
| 1 | Physique | Transmission des bits bruts (câbles, fibres, ondes) |

Le modèle OSI se prend dans un sens ou dans l'autre pour résoudre une pane. 
Soit un commence par regardé si notre cable est branche quand ça ne fonctionne plus, soit on regarde le dernier commit. 

TCP est capable de limiter les capacité réseau en fonction du flux, il régule sa vitesse. 
Il ne faut donc pas utliser ce protocole pour tester la vitesse de sa connexion.

SSH est un logiciel, un protocole, une application et ça porte le même nom. 

### Spécification - IEEE - IETF

**IEEE** Institute of Electronical and Electrics Enginers 

**IETF** Internet Enginers Taks Force 

Il décrivent les protocole que l'on va utiliser. Sa méthode de communication repose sur des RFC. 
l'Adoption d'une RFC se fait par consensus approximatif. 


### Internet 

Les RFC sont la source d'information (en matière de réseau) la plus précise. 

l'Adresse MAC permet d'envoyer des informations et d'en recevoir. 


