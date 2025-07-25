!# /bin/bash

# Install Nginx

dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y

# Start and Enable Nginx Service

sudo systemctl enable nginx
sudo systemctl start nginx

# Remove the default content that web server is serving
rm -rf /usr/share/nginx/html/*

# Download the frontend content
sudo curl -o /tmp/frontend.zip https://roboshopartifacts.s3.amazonaws.com/frontend-v3.zip

# Extract the frontend content
sudo unzip /tmp/frontend.zip -d /usr/share/nginx/html

# Copy the nginx config file
sudo cp nginx.conf /etc/nginx/nginx.conf

# Restart nginx
sudo systemctl restart nginx
#


