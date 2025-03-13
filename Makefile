CPATH=./srcs/docker-compose.yml

all:
	@docker compose -f $(CPATH) up -d --build

down:
	@docker compose -f $(CPATH) down

clean:
	@docker stop $$(docker ps -qa) || true; \
	docker rm $$(docker ps -qa) || true; \
	docker rmi -f $$(docker images -qa) || true; \
	docker volume rm $$(docker volume ls -q) || true; \
	docker network rm $$(docker network ls -q) 2>/dev/null || true;

.PHONY: all down clean
