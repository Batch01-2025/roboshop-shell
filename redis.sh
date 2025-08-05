#!/bin/bash

echo "Disable Redis Module"
sudo dnf module disable redis -y
echo "Exit Status: $?"

echo "Enable Redis Module"
sudo dnf module enable redis:7 -y
echo "Exit Status: $?"

echo "Install Redis"
sudo dnf install redis -y
echo "Exit Status: $?"

echo "Update Listen Address and Protected Mode"
sudo sed -i -e '/^bind/ s/127.0.0.1/0.0.0.0/' -e '/protected-mode/ c protected-mode no' /etc/redis/redis.conf
echo "Exit Status: $?"

echo "Enable & Start Redis Service"
sudo systemctl enable redis
echo "Exit Status: $?"
sudo systemctl start redis
echo "Exit Status: $?"

