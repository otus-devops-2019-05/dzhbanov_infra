#!/bin/bash
sudo killall apt apt-get
sudo apt -y update
sudo killall apt apt-get
sudo apt -y install python-pip
sudo killall apt apt-get
echo "installed python"
sudo pip install ansible
ansible --version
git clone https://github.com/otus-devops-2019-02/dzhbanov_infra.git
