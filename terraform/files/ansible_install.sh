#!/bin/bash
sudo killall apt apt-get
sudo apt-get -y install python-pip
echo "installed python"
sudo pip install ansible
ansible --version
