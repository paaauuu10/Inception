FROM debian:bullseye

#Getting ngincx && openssl
RUN apt-get update && apt-get install -y nginx openssl && rm -rf /var/lib/apt/lists/*

#Copying conf
COPY ./conf/default /etc/nginx/sites-enabled/default

#Copying script && permition
COPY ./tools/script.sh /var/www/script.sh
RUN chmod +x /var/www/script.sh

#The container is listening on that port.
EXPOSE 443

#SCRIPT
ENTRYPOINT ["/var/www/script.sh"]

#daemon off; prevents it from running in the background
CMD ["nginx", "-g", "daemon off;"]
