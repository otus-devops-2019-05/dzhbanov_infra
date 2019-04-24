#!/bin/bash
sudo killall apt apt-get
sudo apt-get -y install python-pip
echo "installed python"
sudo pip install ansible
ansible --version
git clone https://github.com/otus-devops-2019-02/dzhbanov_infra.git
