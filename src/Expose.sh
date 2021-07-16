#!/bin/bash

let "expose = 100 * 100000"	# (100) Zehntel-Sek! Bash kann keine Flieskommazahlen
basename='Orion_light_'		# Basisname

# Leerbild für eom, unelegant, aber robust
raspistill -t 10 --shutter 1000 -ag 16.0 -o /tmp/out.jpg
eom /tmp/out.jpg&

while true
do
   DATE=$(date +"%Y-%m-%d_%H%M%S")
   echo $basename$DATE
 
   raspistill \
      -t 10 -n -awb greyworld -ex off \
      --shutter $expose -q 98 -ag 1.0 \
      -vf -hf \
      -l /tmp/out.jpg -o $PWD/$basename$DATE.jpg

done