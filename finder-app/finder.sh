#!/bin/bash
#
# Search an string recursively (on files in a directory)

if [ $# -lt 2 ];then
  echo "USAGE: $0 <filesdir> <searchstr>"
  exit 1
fi

filedir=$(realpath $1)
searchstr=$2

if [ ! -d $filedir ];then
  echo "$filedir is not a directory"
  exit 1
fi

X=$(find $filedir -type f | wc -l) # count recursively the files in "filedir"
Y=$(grep -n --only-matching $searchstr $(find $filedir -type f) 2> /dev/null | uniq | wc -l) # how many files contain "searchstr" (NOTE: avoid double counting when "searchstr" appears two times in the same line

echo "The number of files are $X and the number of matching lines are $Y"
