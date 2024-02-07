#!/bin/bash
#
# create a new file and write an string on it

if [ $# -lt 2 ];then
  echo "USAGE: $0 <writefile> <writestr>"
  exit 1
fi

writefile=$1
writestr=$2

writedir=$(dirname $writefile)
mkdir -p $writedir
echo $writestr > $writefile
