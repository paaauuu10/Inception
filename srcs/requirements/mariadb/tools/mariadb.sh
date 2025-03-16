#!/bin/sh

service mariadb start

#We check if the DB already exists
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "We don't need to create database, it already exists"
	mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "SHOW DATABASES;";
else
	#We set the instructions to create the BD, answering the questins that mysql_secure_installation asks us.
	#We create de DB
	mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('$MYSQL_ROOT_PASSWORD')";
	echo "1"
	mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
	echo "2"
	mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE;"
	echo "3"
	#Creating Wordpress User.
	mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	echo "4"
	mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
	echo "5"
	mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
	echo "User created in db successfully"

fi

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown


#Executing mysqld
mysqld

