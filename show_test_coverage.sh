#! /bin/sh

nyc -r html mocha 

result=$?

if [ $result = 0 ]; then
  open coverage/index.html
fi
 
