FROM debian:bullseye

#Mariadb instalation
RUN apt-get update && \
	apt-get install -y \
	mariadb-server

#Copying  MariaDB conf
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d

#Copying && setting permission script
COPY ./tools/mariadb.sh /etc
RUN chmod a+x /etc/mariadb.sh

#Setting permission for Mariadb
RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 775 /var/run/mysqld

EXPOSE 3306

#Using script
ENTRYPOINT ["/etc/mariadb.sh"]

