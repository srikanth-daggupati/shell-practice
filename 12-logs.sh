#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo "$2 ...Failed"
        exit 1
    else 
        echo "$2 ...Success"
    fi
}

dnf install nginx -y &>>$LOGS_FILE
VALIDATE $? "Installing Nginx"

dnf install mysql -y &>>$LOGS_FILE
VALIDATE $? "Installing Mysql"

dnf install nodejs -y &>>$LOGS_FILE
VALIDATE $? "Installing NodeJS"

