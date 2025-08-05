#! /bin/bash

dir_path=$(pwd)

NODEJS() {

  echo "Disable Nodejs Module"
  sudo dnf module disable nodejs -y
  echo "Exit status: $?"

  echo "Enable Nodejs Module"
  sudo dnf module enable nodejs:20 -y
  echo "Exit status: $?"

  echo "Install Nodejs"
  sudo dnf install nodejs -y
  echo "Exit status: $?"

  APP_SETUP

  echo "Installing npm dependencies"
  sudo npm install --prefix /app
  echo "Exit status: $?"

  SYSTEMD_SETUP

}

APP_SETUP() {

  echo "Adding the user"
  id roboshop
  if [ $? -ne 0]
  then
    sudo useradd roboshop
  fi

  echo "Exit status: $?"

  echo " creating Directory app"
  if [ ! -d "/app" ]
  then
      sudo mkdir /app
  fi
  echo "Exit status: $?"

  echo "Download the application code"
  sudo curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip
  echo "Exit status: $?"

  echo "Extracting the Application Code"
  sudo unzip /tmp/$component.zip -d /app
  echo "Exit status: $?"

}

SYSTEMD_SETUP() {

echo "Setup the catalogue service"
sudo cp $component.service /etc/systemd/system/$component.service
echo "Exit status: $?"

echo "Load the Service"
sudo systemctl daemon-reload
echo "Exit status: $?"

echo "Enable and Start the Catalogue Service"
sudo systemctl enable $component
echo "Exit status: $?"
sudo systemctl start $component
echo "Exit status: $?"

}