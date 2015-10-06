#!/bin/sh

echo " > SDH Platform"
cd sdh-platform
docker-compose up -d --no-recreate
echo "Done."
echo " > SDH Web"
cd ../sdh-platform-web
docker-compose up -d --no-recreate
echo "Done."

echo "Smart Developer Hub should be ready at http://localhost:9003/ in a few minutes."
