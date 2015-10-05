#!/bin/sh

cd /home/vagrant/sdh-platform
docker-compose start
cd ../sdh-platform-web
docker-compose start