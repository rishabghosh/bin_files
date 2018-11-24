#! /bin/bash

source_file=$1

#install js-beautify -> sudo npm install -g js-beautify
js-beautify -b preserve-inline $source_file > .beautified
mv .beautified $source_file

message="${LIGHTGRAY} Plz run test to see if something is broken"
GREEN='\033[0;32m'
LIGHTGRAY='\033[0;37m'
NC='\033[0m'

#grep --version should be 2.10 or above
echo "$source_file" | grep -io "test"
result=$?

if [ $result = 0 ]; then 
  mocha $source_file
  message="${LIGHTGRAY} mocha tested -> $source_file"
fi

echo -e "${GREEN} $source_file ${LIGHTGRAY} is beautified"
echo -e "$message"

