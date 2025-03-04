#!/bin/sh
# Si el directorio /var/www/html está vacío, descarga y extrae WordPress
if [ -z "$(ls -A /var/www/html)" ]; then
    echo "Directorio vacío. Descargando WordPress..."
    wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
    tar -xzf /tmp/wordpress.tar.gz --strip-components=1 -C /var/www/html
    rm /tmp/wordpress.tar.gz
fi

# Inicia PHP-FPM
exec php-fpm
