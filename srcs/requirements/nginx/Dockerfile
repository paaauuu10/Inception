# Usamos Alpine como base por ser ligera
FROM alpine:latest

# Instalamos NGINX y OpenSSL para manejar certificados
RUN apk add --no-cache nginx openssl

# Copiamos la configuración de NGINX (debes crear el archivo en srcs/requirements/nginx/conf/)
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Copiamos los certificados TLS (ajusta la ruta si es necesario)
COPY certs /etc/nginx/certs

# Exponemos el puerto 443 (HTTPS)
EXPOSE 443

# Iniciamos NGINX en modo daemon off
CMD ["nginx", "-g", "daemon off;"]
