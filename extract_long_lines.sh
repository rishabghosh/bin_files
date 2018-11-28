#! /bin/sh
#show line/s exceeding character limit:

source_file=$1
echo "Lines with length of 80 or more:\n"

grep -n "" $source_file | awk '{
if(length($0)>83)
  print ($0), "\nlength:" length($0) "\n"
}'

