SHELL := /bin/bash
PWD := $(shell pwd)


docker-network-create:
	docker network inspect testing_net >/dev/null 2>&1 || \
	docker network create testing_net --subnet=172.25.125.0/24
.PHONY: docker-network-create

docker-image-backend:
	docker build -f ./Dockerfile -t "backend:latest" .  # Construir imagen del backend
.PHONY: docker-image-backend

docker-image-tests:
	docker build -f ./tests/Dockerfile -t "tests:latest" .  # Construir imagen de tests
.PHONY: docker-image-tests

docker-image: docker-image-backend

docker-compose-up: docker-network-create docker-image
	docker compose -f docker-compose-dev.yaml up -d --build
.PHONY: docker-compose-up


docker-compose-down:
	docker compose -f docker-compose-dev.yaml stop -t 1
	docker compose -f docker-compose-dev.yaml down
.PHONY: docker-compose-down

docker-compose-logs:
	docker compose -f docker-compose-dev.yaml logs -f
.PHONY: docker-compose-logs

docker-compose-test: docker-image-tests
	docker compose -f docker-compose-tests.yaml up --build --exit-code-from tests
.PHONY: docker-compose-test