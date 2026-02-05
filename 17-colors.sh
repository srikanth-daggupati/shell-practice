#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N" | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo -e "$R $2 ...Failed $N" | tee -a $LOGS_FILE
        exit 1
    else 
        echo -e "$G $2 ...Success $N" | tee -a $LOGS_FILE
    fi
}

for package in $@  # sudo sh 14-looops.sh nginx mysql nodejs
do 
    dnf list installed $package $package &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
       echo "$package is not installed, installing now"
       dnf install $package -y &>>$LOGS_FILE
       VALIDATE $? "Installing $package"
    else 
         echo -e "$Y $package is already installed, skipping $N"
    fi
done