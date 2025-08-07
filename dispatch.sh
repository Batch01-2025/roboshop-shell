#! /bin/bash
source ./common.sh
component=dispatch
LOG_FILE=/tmp/roboshop.log
rm -f /tmp/roboshop.log

echo "Install Go Lang"
sudo dnf install golang -y &>>$LOG_FILE
echo "Exit Status: $?"

APP_SETUP &>>$LOG_FILE

echo "Build the Dispatch Service"
cd /app
sudo go mod init dispatch &>>$LOG_FILE
sudo go get &>>$LOG_FILE
sudo go build &>>$LOG_FILE
echo "Exit Status: $?" &>>$LOG_FILE

SYSTEMD_SETUP &>>$LOG_FILE

