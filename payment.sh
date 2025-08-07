#! /bin/bash
source ./common.sh
component=payment
path=$(pwd)

echo "Install Python3, GCC and Python3 Development Libraries"
sudo dnf install python3 gcc python3-devel -y
echo "Exit Status: $?"

APP_SETUP

echo "Install Dependencies"
cd /app
sudo pip3 install -r requirements.txt
echo "Exit Status: $?"

SYSTEMD_SETUP
