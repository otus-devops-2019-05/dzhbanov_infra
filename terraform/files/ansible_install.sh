#!/bin/bash
sudo killall apt apt-get
sleep 10
echo "###########################################"
sudo apt -y update
sleep 10
echo "###########################################"
sudo apt -y install python-pip
sleep 10
echo "###########################################"
echo "installed python"
sudo pip install ansible
ansible --version
git clone https://github.com/otus-devops-2019-02/dzhbanov_infra.git
