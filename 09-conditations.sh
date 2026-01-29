#!/bin/bash

NUMBER=$1

# -gt -> Greater Than
# -lt -> Less Than
# -eq -> equal
# -ne -> not equal
if [ $NUMBER -gt 25 ]; then
    echo "Given number: $NUMBER is greater than 25"
elif [$NUMBER -eq 25]; then
    echo "Given number: $NUMBER is equal to 25"
else
    echo "Given number: $NUMBER is not greater than 25"
fi
