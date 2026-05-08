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

for i in $@ # sudo sh 14-loops.sh nginx mysql nodejs
do
    dnf install $package -y
    VALIDATE $? "$package installation"
done

