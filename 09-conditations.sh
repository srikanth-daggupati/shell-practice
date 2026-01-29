#!/bin/bash

NUMBER=$1

# -gt -> Greater Than
# -lt -> Less Than
# -eq -> equal
# -ne -> not equal
if [ $NUMBER -gt25 ]; then
    echo "Given number: $NUMBER is greater than 25"
else
    echo "Given number: $NUmber is not greater than25"
fi
