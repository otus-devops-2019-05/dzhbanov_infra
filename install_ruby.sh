#!/bin/bash
echo "first lets update apt"
sudo apt update
echo "now lets install ruby and bundler"
sudo apt install -y ruby-full ruby-bundler build-essential
echo "now lets check ruby"
ruby -v
echo "now lets check bundler"
bundler -v
