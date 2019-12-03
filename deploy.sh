apt-get update
apt-get install curl
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt install nodejs
cd $WORKSPACE/src/frontend
npm install
sh $WORKSPACE/gradlew build