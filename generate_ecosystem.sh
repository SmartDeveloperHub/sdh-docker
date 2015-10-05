#!/bin/sh

ROOT=$(pwd)

SDH_PLATFORM="sdh-platform"
SDH_WEB="sdh-platform-web"
TAG=$1

Update_Ecosystem() {  
  echo " > Services tag: $TAG"
  if [ ! -d $SDH_PLATFORM ]
  then
    git clone https://github.com/SmartDeveloperHub/$SDH_PLATFORM $SDH_PLATFORM
    cd $SDH_PLATFORM
    git checkout $TAG
    cd ..
  else
    cd $SDH_PLATFORM
    git pull
    cd $ROOT
  fi
  if [ ! -d $SDH_WEB ]
  then
    git clone https://github.com/SmartDeveloperHub/$SDH_WEB $SDH_WEB
    cd $SDH_WEB
    git checkout $TAG
    cd ..
  else
    cd $SDH_WEB
    git pull
    cd $ROOT
  fi
}

echo " > Updating Repositories..."
Update_Ecosystem
echo "Updated."
echo " > Creating and starting the platform..."
cd $SDH_PLATFORM
docker-compose build && docker-compose stop && docker-compose rm -f && docker-compose up -d
echo "Done."
echo " > Creating and starting the web environment..."
cd ../$SDH_WEB
docker-compose build && docker-compose stop && docker-compose rm -f && docker-compose up -d
echo "Done."
echo "Smart Developer Hub should be ready at http://localhost:9003/ in a few minutes."

