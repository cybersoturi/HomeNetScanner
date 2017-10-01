#!/bin/bash
#version 1.0.0 1.10.2017

#set up default folder
FOLDER="/home/pi/netskanner"

#date >> scan.log
#echo "main alkaa" >> scan.log

# starting scan, lights to yellow, scan
$FOLDER/lights.sh 2
$FOLDER/netscanner.sh
$FOLDER/compare.sh
# compare.sh returns value for lights.sh 3 for green and 1 for alarm
$FOLDER/lights.sh $?

