#! /bin/bash

awk_script=$1
echo "#! /usr/bin/awk -f" > $awk_script
echo " " >> $awk_script
chmod +x $awk_script

vim $awk_script
