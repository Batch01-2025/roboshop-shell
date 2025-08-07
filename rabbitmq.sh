#! /bin/bash
path=$(pwd)

echo "Copy the Repo file "
sudo cp $path/rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo
echo "Exit Status: $?"

echo "Install Rabbitmq Server"
sudo dnf install rabbitmq-server -y
echo "Exit Status: $?"

echo "Enable and Start the RabbitMQ Service"
sudo systemctl enable rabbitmq-server
echo "Exit Status: $?"
sudo systemctl start rabbitmq-server
echo "Exit Status: $?"

echo "Create RabbitMQ User"
sudo rabbitmqctl add_user roboshop roboshop123
echo "Exit Status: $?"
sudo rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
echo "Exit Status: $?"


