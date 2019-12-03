apt-get install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
agt install nodejs
cd $WORKSPACE/src/frontend
npm install
cd $WORKSPACE
./gradlew build