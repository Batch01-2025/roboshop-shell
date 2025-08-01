#! /bin/bash

echo "Disable Nodejs Module"
sudo dnf module disable nodejs -y
echo "Exit status: $?"

echo "Enable Nodejs Module"
sudo dnf module enable nodejs:20 -y
echo "Exit status: $?"

echo "Install Nodejs"
sudo dnf install nodejs -y
echo "Exit status: $?"

echo "Adding the user"
sudo useradd roboshop
echo "Exit status: $?"

echo " creating Directory app"
sudo mkdir /app
echo "Exit status: $?"

echo "Download the application code"
sudo curl -o /~/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
echo "Exit status: $?"

echo "Extracting the Application Code"
sudo unzip /tmp/catalogue.zip -d /app
echo "Exit status: $?"

echo "Installing npm dependencies"
sudo npm install --prefix /app
echo "Exit status: $?"

echo "Setup the catalogue service"
sudo cp catalogue.service /etc/systemd/system/catalogue.service
echo "Exit status: $?"

echo "Load the Service"
sudo systemctl daemon-reload
echo "Exit status: $?"

echo "Enable and Start the Catalogue Service"
sudo systemctl enable catalogue
echo "Exit status: $?"
sudo systemctl start catalogue
echo "Exit status: $?"

echo "Copy MongoDB Client Repo"
sudo cp mongo.repo /etc/yum.repos.d/mongo.repo
echo "Exit status: $?"

echo "Install MongoDB Client"
sudo dnf install mongodb-mongosh -y
echo "Exit status: $?"

echo "Load Master Data"
sudo mongosh --host 172.31.93.38 </app/db/master-data.js
echo "Exit status: $?"












