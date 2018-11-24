#! /bin/bash

GREEN='\033[0;32m'
LIGHTGRAY='\033[0;37m'
NC='\033[0m'
RED='\033[0;31m'
source_file=$1
message="${LIGHTGRAY} Plz run test to see if something is broken"

#fail safe:
which js-beautify 1>>/dev/null
is_installed=$?
if [ $is_installed -ne 0 ]; then
  echo -e "${RED} Plz install js-beautify"
  echo -e "${LIGHTGRAY} sudo npm install -g js-beautify"
  exit
fi

#install js-beautify -> sudo npm install -g js-beautify
js-beautify -b preserve-inline $source_file > .beautified
mv .beautified $source_file

#grep --version should be 2.10 or above
echo "$source_file" | grep -io "test" 1>>/dev/null
result=$?

if [ $result = 0 ]; then 
  mocha $source_file
  message="${LIGHTGRAY} mocha tested -> $source_file"
fi

echo -e "${GREEN} $source_file ${LIGHTGRAY} is beautified"
echo -e "$message"

