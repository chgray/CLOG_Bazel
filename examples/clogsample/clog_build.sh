#!/bin/bash

echo "....calling CLOG"

tool=$1
config=$2
sidecar=$3
file=$4
outputDir=$5
outputSideCar=$6

echo "------------"
echo "      Tool    : $tool"
echo "    Config    : $config"
echo "   SideCar    : $sidecar"
echo "      File    : $file"
echo "Output Dir    : $outputDir"
echo "Output SideCar: $outputSideCar"
echo "-=-=-=-"
ls 
echo "======="
# find .
echo "=-=-=-=-="

export CLOG_DEVELOPMENT_MODE=1
$1 --outputDirectory $outputDir -c $config -s $sidecar --outputSideCar $outputDir/$outputSideCar --scopePrefix TEST -p printf --inputFiles $file --verboseErrors

echo "*+*+*+*+*+*+*+*"
ls $5
echo "***************"
# find $5

exit 0