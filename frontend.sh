#! /bin/bash

echo "Disable Nginx Module"
sudo dnf module disable nginx -y
Status_print $?

echo "Enable Nginx Module"
sudo dnf module enable nginx:1.24 -y
Status_print $?

echo "Install Nginx"
sudo dnf install nginx -y
Status_print $?

echo "Start and Enable Nginx Service"
sudo systemctl enable nginx
Status_print $?

echo "Copy the nginx config file"
sudo cp nginx.conf /etc/nginx/nginx.conf
Status_print $?

echo "Start Nginx Service"
sudo systemctl start nginx
Status_print $?

echo "Remove Nginx the default content"
rm -rf /usr/share/nginx/html/*
Status_print $?

echo "Download the frontend content"
sudo curl -o /tmp/frontend.zip https://roboshopartifacts.s3.amazonaws.com/frontend-v3.zip
Status_print $?

echo "Extract the frontend content"
sudo unzip /tmp/frontend.zip -d /usr/share/nginx/html
Status_print $?

echo "Restart nginx"
sudo systemctl restart nginx
Status_print $?



