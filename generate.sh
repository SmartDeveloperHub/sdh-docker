#!/bin/sh

ROOT=$(pwd)

SDH_PLATFORM="sdh-platform"
SDH_WEB="sdh-platform-web"
TAG=$1

Update_Part() {
  echo " > Updating Repository..."
  if [ ! -d $1 ]
  then
    git clone https://github.com/SmartDeveloperHub/$1 $1
    cd $1
    git checkout $TAG
  else
    cd $1
    git pull    
  fi  
  echo $1 " updated."  
  echo " > Creating and starting $1..."
  docker-compose build && docker-compose stop && docker-compose rm -f && docker-compose up -d
  echo "Done."
  cd $ROOT
}

echo " > Services tag: $TAG"
Update_Part $SDH_PLATFORM
Update_Part $SDH_WEB

echo "Smart Developer Hub should be ready at http://localhost:9003/ in a few minutes."
