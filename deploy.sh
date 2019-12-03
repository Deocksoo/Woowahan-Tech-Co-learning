apt-get install curl
curl -sL https://deb.nodesource.com/setup_12.x | -E bash -
apt install nodejs
cd $WORKSPACE/src/frontend
npm install
cd $WORKSPACE
./gradlew build