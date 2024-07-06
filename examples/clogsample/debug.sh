#!/bin/bash

echo "....calling CLOG"

tool=$1
config=$2
sidecar=$3
file=$4
outputDir=$5

echo "DBG: ------------"
echo "      Tool : $tool"
echo "    Config : $config"
echo "   SideCar : $sidecar"
echo "      File : $file"
echo "Output Dir : $5"
echo "-=-=-=-"
ls 
echo "======="
ls -l $tool 

echo "*+*+*+*+*+*+*+*"
ls $5
echo "***************"
find $5 | grep clog.h

exit 1