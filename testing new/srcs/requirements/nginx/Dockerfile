#Utilitzem la imatge de Debian (es la penultima versio)
FROM debian:bullseye

#Actualitzem i instalem nginx i OpenSSL i borrem arxius de cache
RUN apt-get update && \
	apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

#Generem el certificat autofirmat
#RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#	-out /etc/ssl/ojimenez.42.fr.pem \
#	-keyout /etc/ssl/ojimenez.42.fr.key \
#	-subj "/C=ES/ST=Barcelona/L=Barcelona/O=42 School/OU=Barcelona/CN=ojimenez.42.fr"

#Copiem l'arxiu default al directori corresponent
COPY ./conf/default /etc/nginx/sites-enabled/default

#Copiem l'arxiu de configuracio de nginx
#COPY ./conf/nginx.conf /etc/nginx/nginx.conf

#Copiem l'script d'inici
COPY ./tools/script.sh /var/www/script.sh

#Copiem l'script d'inici
#COPY ./tools/script.sh /script.sh

#Donem permisos per executar
#RUN chmod +x /script.sh

# Dar permisos de ejecución al script de inicio
RUN chmod +x /var/www/script.sh

#Indiquem que volem exposar el port del HTTPS
EXPOSE 443

ENTRYPOINT ["/var/www/script.sh"]

#Iniciem nginx en primer pla
#CMD ["/script.sh"]
CMD ["nginx", "-g", "daemon off;"]
