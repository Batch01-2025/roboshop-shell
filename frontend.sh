#! /bin/bash

echo "Disable Nginx Module"
sudo dnf module disable nginx -y
echo "Exit status: $?"

echo "Enable Nginx Module"
sudo dnf module enable nginx:1.24 -y
echo "Exit status: $?"

echo "Install Nginx"
sudo dnf install nginx -y
echo "Exit status: $?"

echo "Start and Enable Nginx Service"
sudo systemctl enable nginx
echo "Exit status: $?"

echo "Copy the nginx config file"
sudo cp nginx.conf /etc/nginx/nginx.conf
echo "Exit status: $?"

echo "Start Nginx Service"
sudo systemctl start nginx
echo "Exit status: $?"

echo "Remove Nginx the default content"
rm -rf /usr/share/nginx/html/*
echo "Exit status: $?"

echo "Download the frontend content"
sudo curl -o /~/frontend.zip https://roboshopartifacts.s3.amazonaws.com/frontend-v3.zip
echo "Exit status: $?"

echo "Extract the frontend content"
sudo unzip /~/frontend.zip -d /usr/share/nginx/html
echo "Exit status: $?"

echo "Restart nginx"
sudo systemctl restart nginx
echo "Exit status: $?"



