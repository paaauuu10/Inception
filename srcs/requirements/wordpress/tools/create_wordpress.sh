#!/bin/sh

mkdir -p /var/www/html

# Check if wp-config.php already exists, if not, create it
if [ -f /var/www/html/wp-config.php ]; then
    echo "WordPress already downloaded"
else
    echo "Downloading WordPress..."

    # Install WordPress and configuration files
    # Use wget to download the compressed file
    wget http://wordpress.org/latest.tar.gz || { echo "Failed to download WordPress"; exit 1; }
    # Extract the compressed file with tar
    tar xfz latest.tar.gz || { echo "Failed to extract WordPress"; exit 1; }
    # Move all WordPress directories to the current directory
    mv wordpress/* /var/www/html/ || { echo "Failed to move WordPress files"; exit 1; }
    # Remove the compressed file
    rm -rf latest.tar.gz
    # Remove the WordPress directory as it's now empty
    rm -rf wordpress

    # Import variables
    # Use sed to replace username_here with the MYSQL_USER variable
    sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wp-config-sample.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wp-config-sample.php
    sed -i "s/localhost/$MYSQL_HOSTNAME/g" /var/www/html/wp-config-sample.php
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/html/wp-config-sample.php

    # Copy the file wp-config-sample.php to wp-config.php, which WordPress will use
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

    # Set permissions for the WordPress files
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html

    echo "WordPress correctly downloaded"
# End of if/else
fi

# Execute the command to start the server
exec "$@"
