#! /bin/bash

echo "Disable Nginx Module"
sudo dnf module disable nginx -y
Status_Print $?

echo "Enable Nginx Module"
sudo dnf module enable nginx:1.24 -y
Status_Print $?

echo "Install Nginx"
sudo dnf install nginx -y
Status_Print $?

echo "Start and Enable Nginx Service"
sudo systemctl enable nginx
Status_Print $?

echo "Copy the nginx config file"
sudo cp nginx.conf /etc/nginx/nginx.conf
Status_Print $?

echo "Start Nginx Service"
sudo systemctl start nginx
Status_Print $?

echo "Remove Nginx the default content"
rm -rf /usr/share/nginx/html/*
Status_Print $?

echo "Download the frontend content"
sudo curl -o /tmp/frontend.zip https://roboshopartifacts.s3.amazonaws.com/frontend-v3.zip
Status_Print $?

echo "Extract the frontend content"
sudo unzip /tmp/frontend.zip -d /usr/share/nginx/html
Status_Print $?

echo "Restart nginx"
sudo systemctl restart nginx
Status_Print $?



