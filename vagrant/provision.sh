#!/bin/sh
apt-get install dos2unix -y
cp /vagrant/*.sh .
dos2unix generate.sh
dos2unix startup.sh
dos2unix shutdown.sh
./generate.sh master
