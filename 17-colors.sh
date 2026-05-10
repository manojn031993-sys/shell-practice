#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/12-logs.log"

if [ $USERID -ne 0 ]; then
    echo -e "$R please run this script as root user access or sudo access $N" | tee -a $LOGS_FILE
    exit 1
fi    

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2 ...$R FAILURE $N" | tee -a $LOGS_FILE
        exit 1
    else 
        echo -e "$2 ...$G SUCCESS $N" | tee -a $LOGS_FILE
    fi
}

for package in $@ # sudo sh 14-loops.sh nginx mysql nodejs
do
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "$package installation"
    else
        echo -e "$package is already installed...$Y skipping $N"
    fi
done