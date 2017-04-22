#!/bin/bash
#home network scan
#version 1.0.1, 20.3.2017

#identify host's LAN IPv4 address
LAN=$(ifconfig|grep Bcast|cut -d":" -f2|cut -d" " -f1)

#to optimize, identify the subnet mask
MASK=$(ifconfig|grep Bcast|cut -d":" -f4|cut -d"." -f4)

#scan all possible LAN IP address' and write a sorted list of identified IPs and MACs
nmap -sP $LAN/24|awk '/Nmap scan report for/{printf $5;}/MAC Address:/{print " "$3;}'|sort -V > /home/pi/result.list

#this list still miss scanner host,s MAC address
#get the host IP and MAC and add it to correct place in the list
ownIP=$(ifconfig|grep Bcast|cut -d":" -f2|cut -d" " -f1)
ownMAC=$(ifconfig|grep HWaddr|cut -d" " -f11)

sed -i 's/\b'"$ownIP"'\b/&'" $ownMAC"'/' /home/pi/result.list
