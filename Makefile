DOCKER_NAME=webtop
VOLUME_NAME=webtop-config

.PHONY: backup restore clean

start:
	DOCKER_PUID=$(shell id -u) \
	DOCKER_PGID=$(shell id -g) \
	docker compose up -d
	docker compose logs -f

stop:
	docker compose down

docker-image-clean:
	docker stop $(DOCKER_NAME)
	docker rm -f $(DOCKER_NAME)

docker-vol-clean:
	docker volume rm -f $(VOLUME_NAME)
