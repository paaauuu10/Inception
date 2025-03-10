FROM debian:bullseye

#Getting mariadb
RUN apt-get update && apt-get install -y mariadb-server

#Copying maridb conf
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d

#Coying script && work with permition
COPY ./tools/mariadb.sh /etc
RUN chmod a+x /etc/mariadb.sh

#Working on permision Mariadb
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 775 /var/run/mysqld

#Port where Mariadb listents
EXPOSE 3306

#Script
ENTRYPOINT ["/etc/mariadb.sh"]
