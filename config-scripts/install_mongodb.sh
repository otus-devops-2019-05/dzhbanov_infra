#!/bin/bash
set -e
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

