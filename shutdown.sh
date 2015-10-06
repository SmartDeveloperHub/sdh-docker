#!/bin/sh

echo " > SDH Platform"
cd sdh-platform
docker-compose stop
echo "Done."
echo " > SDH Web"
cd ../sdh-platform-web
docker-compose stop
echo "Done."

echo "Smart Developer Hub has been shut down."
