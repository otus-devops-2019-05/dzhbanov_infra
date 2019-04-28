#!/bin/bash
sudo killall apt apt-get
echo "###########################################"
sudo apt-get -y install python-pip
echo "###########################################"
echo "installed python"
sudo pip install ansible
mkdir ansible
#git clone https://github.com/otus-devops-2019-02/dzhbanov_infra.git
