#!/bin/bash

USERID=$(id -u) 

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "ERROR:: You must have sudo access to execute this script"
        exit 1
    fi
}

CHECK_ROOT

dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

for package in docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
do
    dnf list installed "$package"
    if [ $? -ne 0 ]
    then
        dnf install -y "$package"
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already... INSTALLED"
    fi
done

# Start and enable Docker service
systemctl start docker
VALIDATE $? "Starting Docker service"

systemctl enable docker
VALIDATE $? "Enabling Docker service"

# Add ec2-user to the Docker group
usermod -aG docker ec2-user
VALIDATE $? "Adding ec2-user to Docker group"