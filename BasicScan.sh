#!/bin/bash
#home network scan

#identify LAN ip and build ip space for scanning with ifconfig
range=$(ifconfig|grep Bcast|cut -d":" -f3|cut -d" " -f1)
end=/24

#finding hosts and MAC with NMAP ping scan and writing them to list
nmap -sP $range$end | awk '/Nmap scan report for/{printf $5;}/MAC Address:/{print " "$3;}' | sort $ >> /foo/bar/result.list
