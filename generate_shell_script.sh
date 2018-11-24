#! /bin/bash

shell_script=$1
echo "#! /bin/sh" > $shell_script
echo " " >> $shell_script
chmod +x $shell_script

vim $shell_script
