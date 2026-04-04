DOCKER_NAME=webtop
VOLUME_NAME=webtop-config

.PHONY: backup restore clean

start:
	PUID=$(shell id -u) \
	PGID=$(shell id -g) \
	docker compose up -d
	docker compose logs -f

stop:
	docker compose down

docker-image-clean:
	# docker rm -f $$(docker ps -qa)
	docker rm -f $(DOCKER_NAME)

docker-vol-clean:
	docker volume rm -f $(VOLUME_NAME)
