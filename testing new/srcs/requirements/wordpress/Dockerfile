FROM debian:bullseye

#Instalem els paquets per a PHP, php amb mysql, acces a bdd (pdo)...
RUN apt-get update && apt-get -y install \
	curl \
	wget \
	php7.4-fpm \
	php7.4-mysqli \
	php7.4-pdo \
	php7.4-gd \
	php7.4-cli \
	php7.4-mbstring \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

#Descarreguem i configurem WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

#Creem el directori de PHP-FPM i ajustem permisos
RUN mkdir -p /run/php && chmod 755 /run/php

#Creem el directori per als arxius wordpress
RUN mkdir -p /var/www/html

#Copiem l'arxiu de configuracio de PHP-FPM
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

#Copiem i configurem el script d'inicialitzacio
COPY ./tools/create_wordpress.sh /usr/local/bin/create_wordpress.sh
RUN chmod +x /usr/local/bin/create_wordpress.sh

#Creem el directori per a PHP-FPM
#RUN mkdir -p /run/php
#Copiem el fitxer de configuracio de php
#COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

#Defineix el directori de treball
WORKDIR /var/www/html/

#Diem el port
Expose 9000

#Script de  creacio de WordPress
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

#Iniciem PHP. El -F es para iniciar en primer pla
CMD ["php-fpm7.4", "-F"]
