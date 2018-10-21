#!/bin/bash
# Starts a JMeter test that is passed via command line arguments
echo Usage:
echo ./launch_test.sh [Jmeter Script] [result report path] [Server]] [ServerPort] [VUCount] [LoopCount] [Dynatrace LoadTestName]
echo Example:  ./launch_test.sh frontend_load.jmx ./results 35.237.86.214 8079 5 500 frontend_load

if [ -z "$1" ]; then
  echo "Usage: Arg 1 needs to be valid <yourtestscript.jmx>"
  exit 1
fi
if [ -z "$2" ]; then
  echo "Usage: Arg 2 needs to be a valid path for results report"
  exit 1
fi
if [ -z "$3" ]; then
  echo "Usage: Arg 3 needs to be the URL or IP of your service that should be tested"
  exit 1
fi
ServerPort=$4
if [ -z "$4" ]; then
  ServerPort=80
fi
VUCount=$5
if [ -z "$5" ]; then
  VUCount=1
fi
LoopCount=$6
if [ -z "$6" ]; then
  LoopCount=1
fi
DT_LTN=$7
if [ -z "$7" ]; then
  DT_LTN=MyLoadTestName
fi

echo "Running with SERVER_URL=$3, VUCount=$VUCount, LoopCount=4LoopCount, DT_LTN=$DT_LTN"

#rm -f -r $2
#mkdir $2
#docker run --name jmeter-test -v "${PWD}/scripts":/scripts -v "${PWD}/$2":/results --rm -d jmeter ./jmeter/bin/jmeter.sh -n -t /scripts/$1 -e -o /results -l result.tlf -JSERVER_URL="$3" -JDT_LTN="$DT_LTN" -JVUCount="$VUCount" -JLoopCount="$LoopCount" -JSERVER_PORT="$ServerPort"
echo "Running test:"
echo "Script: $1"
echo "Result folder: $2"
echo "URL: $3"
echo "Server Port: $ServerPort"
echo "VUCount: $VUCount"
echo "LoopCount: $LoopCount"
echo "LTN: $DT_LTN"
docker run --name jmeter-test -v "${PWD}/scripts":/scripts -v "${PWD}/$2":/results -v "${PWD}/results_log":/results_log -v "${PWD}/results_raw":/results_raw --rm -d robjahn/jmeter ./jmeter/bin/jmeter.sh -n -t /scripts/$1 -f -e -j /results_log/jmeter.log -l /results_raw/result.tlf -JSERVER_URL="$3" -JDT_LTN="$DT_LTN" -JVUCount="$VUCount" -JLoopCount="$LoopCount"
