#!/bin/bash
echo "first lets update apt"
sudo apt update
echo "now lets install ruby and bundler"
sudo apt install -y ruby-full ruby-bundler build-essential
echo "now lets check ruby"
ruby -v
echo "now lets check bundler"
bundler -v
echo "get keys"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "now add repo" 
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
echo "now update apt"
sudo apt update
echo "now install mongodb"
sudo apt install -y mongodb-org
echo "start mongodb"
sudo systemctl start mongod
echo "autostart mongo"
sudo systemctl enable mongod
echo "cloning repo"
git clone -b monolith https://github.com/express42/reddit.git
echo "move to folder"
cd reddit && bundle install
echo "run app"
puma -d
echo "check app"
ps aux | grep puma
