#!/bin/bash
arp |awk '/ether/{printf $1;}/ether/{print " "$3;}'|sort -V > /home/pi/arp.list
