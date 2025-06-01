build:
	docker compose -f srcs/docker-compose.yml build --no-cache

up:
	docker compose -f srcs/docker-compose.yml up

down:
	docker compose -f srcs/docker-compose.yml down

restart: down up

clean:
	docker compose -f srcs/docker-compose.yml down -v --rmi local

.PHONY: build up down restart clean
