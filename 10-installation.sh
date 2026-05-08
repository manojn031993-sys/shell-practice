#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "please run this script as root user access or sudo access"
    exit 1
fi    

echo "Installing Nginx web server"
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Installing Nginx ... FAILURE"
    exit 1
else 
    echo "Installing Nginx ... SUCCESS"
fi     

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing MySQL ... FAILURE"
    exit 1
else
    echo "Installing MySQL ... SUCCESS"
fi

dnf install nodejs -y

if [ $? -ne 0 ]; then
    echo "Installing Node.js ... FAILURE"
    exit 1
else
    echo "Installing Node.js ... SUCCESS"
fi