FROM php:fpm

# Actualiza e instala las dependencias necesarias para compilar extensiones PHP
RUN apt-get update && apt-get install -y \
      libxml2-dev \
      libpng-dev \
      libjpeg-dev \
      libfreetype6-dev \
      && docker-php-ext-configure gd --with-freetype --with-jpeg \
      && docker-php-ext-install gd

# Instala las extensiones mysqli y PDO MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Instala wget y tar para descargar WordPress si aún no están instalados
RUN apt-get install -y wget tar

# Define el directorio de trabajo
WORKDIR /var/www/html

# Copia el script de inicialización de WordPress
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 9000
CMD ["/usr/local/bin/setup.sh"]

