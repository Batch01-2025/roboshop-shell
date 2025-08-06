#!/bin/bash
source ./common.sh
component=shipping

JAVA

echo "Installing Mysql Client"
sudo dnf install mysql -y
echo "Exit status: $?"

echo "Load Schema"
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/db/schema.sql
echo "Exit status: $?"

echo "Creating App User"
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/db/appuser.sql
echo "Exit status: $?"

echo "Load Master Data"
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/db/masterdata.sql
echo "Exit status: $?"

echo "Restarting Shipping Service"
systemctl restart shipping.service
echo "Exit status: $?"










