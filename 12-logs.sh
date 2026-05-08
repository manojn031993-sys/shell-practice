#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/12-logs.log"

if [ $USERID -ne 0 ]; then
    echo "please run this script as root user access or sudo access" | tee -a $LOGS_FILE
    exit 1
fi    

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 ... FAILURE" | tee -a $LOGS_FILE
        exit 1
    else 
        echo "$2 ... SUCCESS" | tee -a $LOGS_FILE
    fi
}

echo "Installing Nginx web server"
dnf install nginx -y &>> $LOGS_FILE |& tee -a $LOGS_FILE
VALIDATE $? "Nginx installation"

dnf install mysql -y &>> $LOGS_FILE |& tee -a $LOGS_FILE
VALIDATE $? "MySQL installation"

dnf install nodejs -y &>> $LOGS_FILE  |& tee -a $LOGS_FIL
VALIDATE $? "NodeJS installation"