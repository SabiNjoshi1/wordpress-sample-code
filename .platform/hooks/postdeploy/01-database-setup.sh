#!/bin/bash

# Define necessary variables
SECRET_NAME="modelpeeps-wp-rds-pw"  # Replace with your secret name in AWS Secrets Manager
REGION="us-east-1"       # Replace with your AWS region

DB_PASSWORD=$(aws secretsmanager get-secret-value --secret-id $SECRET_NAME --region $REGION --query SecretString --output text)

DB_NAME="ebdb"       # Replace with your database name
DB_USER="admin"             # Replace with your database username
DB_HOST="wp-mysql-db.cmuokqciitb8.us-east-1.rds.amazonaws.com"  # Replace with your database host

sed -i "s/'your_db_name'/'$DB_NAME'/g" /tmp/wp-config.php
sed -i "s/'your_db_user'/'$DB_USER'/g" /tmp/wp-config.php
sed -i "s/'your_db_password'/'$DB_PASSWORD'/g" /tmp/wp-config.php
sed -i "s/'your_db_host'/'$DB_HOST'/g" /tmp/wp-config.php

mv /tmp/wp-config.php /var/app/current
