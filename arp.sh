#!/bin/bash

#yellow light
./lights.sh 2

arp |awk '/ether/{printf $1;}/ether/{print " "$3;}'|sort -V > /home/pi/netskanner/arp.list

#green light
./lights.sh 3
