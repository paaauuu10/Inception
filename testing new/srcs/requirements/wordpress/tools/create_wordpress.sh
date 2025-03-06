#!/bin/sh

#NOVA LINEA
mkdir -p /var/www/html

#mirem si wp-config.php ja existeix i sino el creem
if [ -f /var/www/html/wp-config.php ]; then
	echo "wordpress already downloaded"
else
	echo "Downloading WordPress..."

	#Instalem wordpress i arxius de configuracio
	#Amb wget  descarreguem el comprimit
	wget http://wordpress.org/latest.tar.gz || { echo "Failed to download WordPress"; exit 1; }
	#Descomprimim el comprimit amb tar
	tar xfz latest.tar.gz || { echo "Failed to extract WordPress"; exit 1; }
	#Movem tots els directoris de wordpress al actual
	mv wordpress/* /var/www/html/ || { echo "Failed to move WordPress files"; exit 1; }
	#Eliminem el comprimit
	rm -rf latest.tar.gz
	#Elimina el directori Wordpress ja que ara esta buit
	rm -rf wordpress

	#Importem variables
	#Ammb sed reemplacem username_here per la variable MYSQL_USER
	sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" /var/www/html/wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/html/wp-config-sample.php

	#Copia l'arxiu a wp-config-sample.php, que WordPress utilitzara
	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

	#Ajustem els permisos per als arxius de Wordpress
	chown -R www-data:www-data /var/www/html
	chmod -R 755 /var/www/html

	echo "WordPress correctly downloaded"
#Final del if/else
fi

#Executem el comando per iniciar el servidor
exec "$@"
