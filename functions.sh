#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo "$2 ...Failed"
        exit 1
    else 
        echo "$2 ...Success"
    fi
}

dnf install nginx -y
VALIDATE $? "Installing Nginx"

dnf install mysql -y
VALIDATE $? "Installing Mysql"

dnf install nodejs -y
VALIDATE $? "Installing NodeJS"

