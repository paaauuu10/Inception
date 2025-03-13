FROM debian:bullseye

#Installing nginx && OpenSSL && cleaning cache
RUN apt-get update && \
	apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*


#Copying conf file
COPY ./conf/default /etc/nginx/sites-enabled/default

#Copying script && allowing execution
COPY ./tools/script.sh /var/www/script.sh
RUN chmod +x /var/www/script.sh

EXPOSE 443

ENTRYPOINT ["/var/www/script.sh"]

CMD ["nginx", "-g", "daemon off;"]
