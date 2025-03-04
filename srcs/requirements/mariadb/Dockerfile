FROM mariadb:latest

# Instala el cliente de MariaDB
RUN apt-get update && apt-get install -y mariadb-client

# Copia tu archivo de configuración
COPY conf/my.cnf /etc/mysql/my.cnf

VOLUME /var/lib/mysql
EXPOSE 3306
