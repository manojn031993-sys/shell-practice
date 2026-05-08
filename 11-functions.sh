#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "please run this script as root user access or sudo access"
    exit 1
fi    
# by default shell will not execute, only execute when called
VALIDATE(){
    if [ $1? -ne 0 ]; then
        echo "$2 ... FAILURE"
        exit 1
    else 
        echo "$2 ... SUCCESS"
    fi
}


echo "Installing Nginx web server"
dnf install nginx -y

VALIDATE $? "Nginx installation"

dnf install mysql -y

VALIDATE $? "MySQL installation"

dnf install nodejs -y

VALIDATE $? "NodeJS installation"