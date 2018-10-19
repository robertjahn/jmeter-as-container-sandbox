#!/bin/bash
# usage: ./quicklaunch.sh <yourserverip> [MyLoadTestName]

#export SOCK_SHOP_URL=$(kubectl -n sock-shop get svc front-end --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}")

SOCK_SHOP_URL=35.231.104.148

echo Running smoke test against $SOCK_SHOP_URL...
rm -rf results/
#sudo rm -rf results_raw/
#docker rm jmeter-test
./launch_test.sh basiccheck.jmx results $SOCK_SHOP_URL 1 10 "SmokeTest"
