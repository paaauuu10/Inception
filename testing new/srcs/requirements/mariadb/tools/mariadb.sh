#!/bin/sh

service mariadb start

#We check if the DB already exists
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "We don't need to create database, it already exists"
else
	#We set the instructions to create the BD, answering the questins that mysql_secure_installation asks us.

	mysql_secure_installation << FINISH
n
Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
Y
Y
Y
FINISH

	#We create de DB
	mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE;"

	#Creating Wordpress User.
	mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
	echo "User created in db successfully"

fi

service mariadb stop

#Executing mysqld
mysqld

