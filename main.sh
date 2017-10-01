#!/bin/bash
#version 1.0.0 1.10.2017

#set up default folder
FOLDER="/home/pi/netskanner"

# starting scan, lights to yellow
$FOLDER/lights.sh 2
# make nmap.list about existing IPs and MACs
$FOLDER/netscanner.sh
# compare to your existing cmdb.list, which you have to make by yourself
$FOLDER/compare.sh
# compare.sh returns value for lights.sh 3 for green and 1 for alarm
$FOLDER/lights.sh $?

