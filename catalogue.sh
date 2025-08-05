#! /bin/bash
source ./common.sh
component=catalogue

NODEJS

echo "Copy MongoDB Client Repo"
sudo cp mongo.repo /etc/yum.repos.d/mongo.repo
echo "Exit status: $?"

echo "Install MongoDB Client"
sudo dnf install mongodb-mongosh -y
echo "Exit status: $?"

echo "Load Master Data"
sudo mongosh --host 172.31.93.38 </app/db/master-data.js
echo "Exit status: $?"












