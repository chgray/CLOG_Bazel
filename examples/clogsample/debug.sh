#!/bin/bash

echo "....calling debug.sh"

tool=$1
config=$2
sidecar=$3
file=$4
outputDir=$5


echo "DBG: ------------"
echo "      1 : $tool"
echo "      2 : $config"
echo "      3 : $sidecar"
echo "      4 : $file"
echo "      5 : $5"
echo "-=-=-=-"
exit 0


ls 
echo "======="
ls -l $tool 

echo "*+*+*+*+*+*+*+*"
ls $5
echo "***************"
find $5 | grep clog.h

export

echo "-=-=-=-=-="
echo 1 > bazel-out/boogers

ls bazel-out

exit 0
