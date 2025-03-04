# Target por defecto: levanta los contenedores
all: up

# Levanta los contenedores en modo detached y construye las imágenes
up:
	cd srcs && docker-compose up --build -d

# Detiene y remueve los contenedores, redes y volúmenes definidos en srcs/docker-compose.yml
down:
	cd srcs && docker-compose down

# Reconstruye la infraestructura: baja y vuelve a levantar forzando la reconstrucción de las imágenes
rebuild:
	$(MAKE) down
	$(MAKE) up

# Muestra los logs de los contenedores en tiempo real
logs:
	cd srcs && docker-compose logs -f

# Limpia imágenes, contenedores y otros recursos no utilizados (opcional)
clean:
	docker system prune -f

.PHONY: all up down rebuild logs clean
