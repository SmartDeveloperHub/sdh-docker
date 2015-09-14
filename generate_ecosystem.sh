#!/bin/sh

ROOT=$(pwd)

SDH_PLATFORM="sdh-platform"
SDH_WEB="sdh-platform-web"
SDH_ECO="sdh-ecosystem"
SDH_BRANCH_WEB="demo-release-h1"
SDH_BRANCH_PLT="demo-release-h2"

Update_Ecosystem() {
   if [ ! -d $SDH_PLATFORM ]
   then
       git clone https://github.com/SmartDeveloperHub/$SDH_PLATFORM -b $SDH_BRANCH_PLT $SDH_PLATFORM
   else
       cd $SDH_PLATFORM
       git pull
       cd $ROOT
   fi
   if [ ! -d $SDH_WEB ]
   then
       git clone https://github.com/SmartDeveloperHub/$SDH_WEB -b $SDH_BRANCH_WEB $SDH_WEB
   else
       cd $SDH_WEB
       git pull
       cd $ROOT
   fi
}

echo " > Updating Repositories ..."
Update_Ecosystem
echo "Updated."
echo " > Creating Ecosystem ..."
if [ -d $SDH_ECO ]
then
   rm -rf $SDH_ECO
fi
cp -R $SDH_PLATFORM $SDH_ECO
cp -R $SDH_WEB/mysql $SDH_ECO      
cp -R $SDH_WEB/laravel $SDH_ECO        
cp -R $SDH_WEB/phpmyadmin $SDH_ECO           
cp docker-compose.yml $SDH_ECO
rm -rf $SDH_ECO/vagrant
rm $SDH_ECO/Vagrantfile
echo "Created."
cd $SDH_ECO
