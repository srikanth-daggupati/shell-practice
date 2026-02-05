#!/bin/bash

SG-ID="sg-0cc876860cca2f416" # Replace with yur security group id
AMI_ID="ami-0220d79f3f480ecf5" # Replace with your AMI Id

for instance in $@
do 
   instance_id= $( aws ec2 run-instances \
    --image-id $AMI_ID \
    --instance-type "t3.micro" \
    --security-group-ids $SG_ID \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$instance'}]' \
    --query 'Instances[0].InstanceId' \
    --output text)

    if [ $instance == "frontend" ]; then
        IP=$(
            aws ec2 describe-instances \
             --instance-ids $instance_id \
             --query 'Reservations[].Instances[].PublicIpAddress' \
             --output text
            )
    else
        IP=$(
            aws ec2 describe-instances \
             --instance-ids $instance_id \
             --query 'Reservations[].Instances[].PrivateIpAddress' \
             --output text
           )
done