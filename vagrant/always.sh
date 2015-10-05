#!/bin/sh

SDH-PLATFORM="sdh-platform"
SDH-WEB="sdh-platform-web"

cd $SDH-PLATFORM
docker-compose start
cd ../$SDH-WEB
docker-compose start