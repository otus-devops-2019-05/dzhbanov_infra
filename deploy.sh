#!/bin/bash
echo "cloning repo"
git clone -b monolith https://github.com/express42/reddit.git
echo "move to folder"
cd reddit && bundle install
echo "run app"
puma -d
echo "check app"
ps aux | grep puma