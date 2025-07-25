#! /bin/bash

echo "Disable Nginx Module"
sudo dnf module disable nginx -y
status_print $?

echo "Enable Nginx Module"
sudo dnf module enable nginx:1.24 -y
status_print $?

echo "Install Nginx"
sudo dnf install nginx -y
status_print $?

echo "Start and Enable Nginx Service"
sudo systemctl enable nginx
status_print $?

echo "Copy the nginx config file"
sudo cp nginx.conf /etc/nginx/nginx.conf
status_print $?

echo "Start Nginx Service"
sudo systemctl start nginx
status_print $?

echo "Remove Nginx the default content"
rm -rf /usr/share/nginx/html/*
status_print $?

echo "Download the frontend content"
sudo curl -o /tmp/frontend.zip https://roboshopartifacts.s3.amazonaws.com/frontend-v3.zip
status_print $?

echo "Extract the frontend content"
sudo unzip /tmp/frontend.zip -d /usr/share/nginx/html
status_print $?

echo "Restart nginx"
sudo systemctl restart nginx
status_print $?



