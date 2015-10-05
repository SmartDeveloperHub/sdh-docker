#!/bin/sh
apt-get install dos2unix -y
cp /vagrant/generate_ecosystem.sh .
dos2unix generate_ecosystem.sh
./generate_ecosystem.sh h1
