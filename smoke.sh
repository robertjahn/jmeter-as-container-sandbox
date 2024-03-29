#!/bin/bash
# usage: ./quicklaunch.sh <yourserverip> [MyLoadTestName]

#export SOCK_SHOP_URL=$(kubectl -n sock-shop get svc front-end --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}")

SOCK_SHOP_URL=35.231.224.62

echo Running smoke test against $SOCK_SHOP_URL...
./launch_test.sh basiccheck.jmx results $SOCK_SHOP_URL 80 5 10 "SmokeTest"
