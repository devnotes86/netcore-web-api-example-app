#!/bin/bash

./1.build.sh

# deploy to heavymetal-1.dev86.online
./2.deploy_single.sh 213.58.151.19

# deploy to heavymetal-2.dev86.online
./2.deploy_single.sh 213.58.151.24

# deploy to heavymetal-3.dev86.online
./2.deploy_single.sh 213.58.151.26

