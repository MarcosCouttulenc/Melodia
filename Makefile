SHELL := /bin/bash
PWD := $(shell pwd)


docker-image-backend:
	docker build -f ./Dockerfile -t "backend:latest" .  # Construir imagen del backend
.PHONY: docker-image-backend

docker-image: docker-image-backend

docker-compose-up: docker-image
	docker compose -f docker-compose-dev.yaml up -d --build  # Levantar todos los servicios
.PHONY: docker-compose-up

docker-compose-down:
	docker compose -f docker-compose-dev.yaml stop -t 1
	docker compose -f docker-compose-dev.yaml down
.PHONY: docker-compose-down

docker-compose-logs:
	docker compose -f docker-compose-dev.yaml logs -f
.PHONY: docker-compose-logs