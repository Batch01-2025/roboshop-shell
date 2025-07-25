#! /bin/bash

echo "Disable Nginx Module"
sudo dnf module disable nginx -y
status_echo $?

echo "Enable Nginx Module"
sudo dnf module enable nginx:1.24 -y
status_echo $?

echo "Install Nginx"
sudo dnf install nginx -y
status_echo $?

echo "Start and Enable Nginx Service"
sudo systemctl enable nginx
status_echo $?

echo "Copy the nginx config file"
sudo cp nginx.conf /etc/nginx/nginx.conf
status_echo $?

echo "Start Nginx Service"
sudo systemctl start nginx
status_echo $?

echo "Remove Nginx the default content"
rm -rf /usr/share/nginx/html/*
status_echo $?

echo "Download the frontend content"
sudo curl -o /tmp/frontend.zip https://roboshopartifacts.s3.amazonaws.com/frontend-v3.zip
status_echo $?

echo "Extract the frontend content"
sudo unzip /tmp/frontend.zip -d /usr/share/nginx/html
status_echo $?

echo "Restart nginx"
sudo systemctl restart nginx
status_echo $?



