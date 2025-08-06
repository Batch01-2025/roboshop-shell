#!/bin/bash

echo "Install Mysql Server"
sudo dnf install mysql-server -y
echo "Exit status: $?"

echo "Enable and Start the Service"
sudo systemctl enable mysqld
echo "Exit status: $?"
sudo systemctl start mysqld
echo "Exit status: $?"

echo "Setup Mysql Password"
sudo mysql_secure_installation --set-root-pass RoboShop@1
echo "Exit status: $?"
