FROM debian:bullseye

#Instaling PHPH
RUN apt-get update && apt-get -y install curl wget \
	php7.4-fpm php7.4-mysqli php7.4-pdo php7.4-gd php7.4-cli php7.4-mbstring mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

#Configuration of WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#Creating PHP-FPM directory and permission
RUN mkdir -p /run/php && chmod 755 /run/php

#Wordpress directory
RUN mkdir -p /var/www/html

#Copying PHP-FPM conf file
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

#Copying && conf init script
COPY ./tools/create_wordpress.sh /usr/local/bin/create_wordpress.sh
RUN chmod +x /usr/local/bin/create_wordpress.sh



#Working directory
WORKDIR /var/www/html/

#Port
EXPOSE 9000

#Script
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

#Init PHP. -F foreground
CMD ["php-fpm7.4", "-F"]
