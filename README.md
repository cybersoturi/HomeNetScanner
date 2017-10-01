# HomeNetScanner
Scanner verifies your CMBD with net scanning results. 

YOU HAVE TO MAKE YOUR OWN cmdb.list here's an example
192.168.1.1 aa:bb:cc:dd:ee:ff
192.168.1.14 8d:3e:dd:32:32:0a

Installing


Timing for ever 30 minutes, write command
$ crontab -e

Add a line to the end
0,30 * * * * /home/pi/main.sh

Guide
