#!/bin/bash

# Download WP-CLI Phar
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make it executable
chmod +x wp-cli.phar

# Move it to a directory in PATH
mv wp-cli.phar /usr/local/bin/wp

# Add /usr/local/bin to PATH (for Elastic Beanstalk environment)
export PATH=$PATH:/usr/local/bin

# wp core install --url="http://my-app-46fc5677.us-east-1.elasticbeanstalk.com/" --title="Rojen" --admin_user="admin" --admin_password="root@123" --admin_email="admin@example.com" --allow-root
# # Navigate to WordPress installation directory (usually /var/www/html in Elastic Beanstalk)
# cd /var/app/current

# # Install and activate Contact Form 7 plugin
# wp plugin install contact-form-7 --activate --allow-root