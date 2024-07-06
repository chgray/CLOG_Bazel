#!/bin/bash

echo "....calling CLOG"

tool=$1
config=$2
sidecar=$3
file=$4
outputDir=$5

echo "------------"
echo "      Tool : $tool"
echo "    Config : $config"
echo "   SideCar : $sidecar"
echo "      File : $file"
echo "Output Dir : $5"
echo "-=-=-=-"
ls 
echo "======="
find .
echo "=-=-=-=-="

$1 --outputDirectory $outputDir -c $config -s $sidecar --scopePrefix TEST -p printf --inputFiles $file --verboseErrors

echo "*+*+*+*+*+*+*+*"
ls $5
echo "***************"
find $5

exit 0