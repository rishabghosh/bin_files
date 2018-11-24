#! /bin/bash

#install js-beautify -> sudo npm install -g js-beautify
js-beautify -b preserve-inline $1 > .beautified
mv .beautified $1

message="${LIGHTGRAY} Plz run test to see if something is broken"
GREEN='\033[0;32m'
LIGHTGRAY='\033[0;37m'
NC='\033[0m'

#grep --version should be 2.10 or above
echo "$1" | grep -io "test"
result=$?

if [ $result = 0 ]; then 
  mocha $1
  message="${LIGHTGRAY} mocha tested -> $1"
fi

echo -e "${GREEN} $1 ${LIGHTGRAY} is beautified"
echo -e "$message"

