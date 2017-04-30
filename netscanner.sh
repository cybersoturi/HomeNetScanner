#!/bin/bash
#home network scan version 1.0.4, 22.4.2017
#identify host's LAN IPv4 address v 1.0.0

LAN=$(ifconfig|grep Bcast|cut -d":" -f2|cut -d" " -f1)

#identify the subnet mask, can be /24 or smaller v 1.0.2
MASK=$(ifconfig|grep Bcast|cut -d":" -f4|cut -d"." -f4)

D2B=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
ARVO=${D2B[$MASK]}
ARVO=$(echo $ARVO | cut -d"0" -f1 | wc -c)
MASK=$((23+$ARVO))


#scan all possible LAN IP address' and write a sorted list of identified IPs and MACs v 1.0.0
nmap -sP $LAN/$MASK|awk '/Nmap scan report for/{printf $5;}/MAC Address:/{print " "$3;}'|sort -V > /home/pi/result.list

#this list still miss scanner host's MAC address
#get the host IP and MAC and add it to correct place in the list v 1.0.1
ownIP=$(ifconfig|grep Bcast|cut -d":" -f2|cut -d" " -f1)
ownMAC=$(ifconfig|grep HWaddr|cut -d" " -f11)

sed -i 's/\b'"$ownIP"'\b/&'" $ownMAC"'/' /home/pi/result.list
