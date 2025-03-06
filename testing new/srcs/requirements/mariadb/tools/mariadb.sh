#!/bin/sh

service mariadb start

#Mirem si ja existeix la base de dades
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "We don't need to create database, it already exists"
else
	#Configurem la base de dades
	#Fem un heredoc per simular i automatitzar les respostes d'instalació
	#Contrasenya per al usuari?
	#Contrasenya i repeticio
	#Eliminar usuaris anonims?
	#Deshabilitar l'inici de sessió remot? N
	#Eliminar base de dades prova
	#Recarregar les taules de privilegis?
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

	#Donem accés al usuari root desde qualsevol host
	mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE;"

	#Creem la BDD i l'usuari de Wordpress. Aqui ens conectarem amb el .sql per crear la bdd.
	mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
	echo "User created in db successfully"

fi

#Aturem Mariadb que estava en segon pla
service mariadb stop

#Executem
mysqld

