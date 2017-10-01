#!/bin/bash
#version 1.0.1 1.10.2017
#alarm state set to 3, which is green
ALARMSTATE=3
#read every string from nmap.list and compare, if they exist in cmdb.list
FOLDER="/home/pi/netskanner"
#count the lines
LUKU=$(wc -l $FOLDER/nmap.list|cut -d" " -f1)

#check IPs from nmap.list
for i in $(seq 1 $LUKU)
do
 TARGET=$(grep . $FOLDER/nmap.list | cut -d" " -f1 |head -n $i|tail -1)
 if grep -q $TARGET $FOLDER/cmdb.list; then
   :
 else
   ALARMSTATE=1
   date >> alarm.log
   sudo echo "false ip" $TARGET >> alarm.log
 fi
done
#nmap.list MAC addresses
for i in $(seq 1 $LUKU)
do
 TARGET=$(grep : $FOLDER/nmap.list | cut -d" " -f2 |head -n $i|tail -1)
 if [ $TARGET ];then
   if grep -q $TARGET $FOLDER/cmdb.list; then
     :
   else
     ALARMSTATE=1
     date >> alarm.log
     sudo echo "false mac" $TARGET >> alarm.log
   fi
  fi
done

exit $ALARMSTATE
