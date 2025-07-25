#! /bin/bash

PRINT Disable Nginx Module
sudo dnf module disable nginx -y
status_print $?

PRINT Enable Nginx Module
sudo dnf module enable nginx:1.24 -y
status_print $?

PRINT Install Nginx
sudo dnf install nginx -y
status_print $?

PRINT Start and Enable Nginx Service
sudo systemctl enable nginx
status_print $?

PRINT Copy the nginx config file
sudo cp nginx.conf /etc/nginx/nginx.conf
status_print $?

PRINT Start Nginx Service
sudo systemctl start nginx
status_print $?

PRINT Remove Nginx the default content
rm -rf /usr/share/nginx/html/*
status_print $?

PRINT Download the frontend content
sudo curl -o /tmp/frontend.zip https://roboshopartifacts.s3.amazonaws.com/frontend-v3.zip
status_print $?

PRINT Extract the frontend content
sudo unzip /tmp/frontend.zip -d /usr/share/nginx/html
status_print $?

PRINT Restart nginx
sudo systemctl restart nginx
status_print $?



