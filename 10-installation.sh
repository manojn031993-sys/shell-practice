#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "please run this script as root user access or sudo access"
    exit 1
fi    

  echo "Installing Nginx web server"
dnf install nginx -y
if [ $? -ne 0 ]; then
    echo "Nginx installation ... FAILURE"
    exit 1
else 
    echo "Nginx installation ... SUCCESS"
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "MySQL installation ... FAILURE"
    exit 1
else 
    echo "MySQL installation ... SUCCESS"
fi

dnf install nodejs -y
if [ $? -ne 0 ]; then
    echo "NodeJS installation ... FAILURE"
    exit 1
else 
    echo "NodeJS installation ... SUCCESS"
fi

