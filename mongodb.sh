#!/bin/bash

echo "Copy Mongodb Repo file"
cp mongodb.repo /etc/yum.repos.d/mongo.repo
echo "Exit Status: $?"

echo " Install Mongodb server"
sudo dnf install mongodb-org -y
echo "Exit Status: $?"


echo "Enable and Start the service"
sudo systemctl enable mongod
sudo systemctl start mongod
echo "Exit Status: $?"

echo "Update Mongodb Conf file to Listen address"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
echo "Exit Status: $?"

echo "Restart the service"
sudo systemctl restart mongod
echo "Exit Status: $?"
