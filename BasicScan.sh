#!/bin/bash
#home network scan

#identify LAN Broadcast IP
LAN=$(ifconfig | grep Bcast|cut -d":" -f3 | cut -d" " -f1)

#scan all possible LAN IP address' and write a sorted list of identified IPs and MACs
nmap -sP $LAN/24 | awk '/Nmap scan report for/{printf $5;}/MAC Address:/{print " "$3;}' | sort $ > /foo/bar/result.list
