#! /bin/bash
source ./common.sh
component=dispatch

echo "Install Go Lang"
sudo dnf install golang -y
echo "Exit Status: $?"

APP_SETUP

echo "Build the Dispatch Service"
cd /app
sudo go mod init dispatch
sudo go get
sudo go build
echo "Exit Status: $?"

SYSTEMD_SETUP

