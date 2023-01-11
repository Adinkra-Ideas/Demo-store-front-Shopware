.PHONY: help
.DEFAULT_GOAL := help

PHP_VERSION_CURRENT=$(shell php -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;')

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# ---------------------------------------------------------------------------------------------
docker-start: ## starts the docker container
	docker-compose up -d

# ---------------------------------------------------------------------------------------------
docker-exec: ## connects to docker container
	docker exec -it dockware-demoshop_shop bash

# ---------------------------------------------------------------------------------------------
docker-stop: ## stops the docker container
	docker stop dockware-demoshop_shop
	docker stop dockware-demoshop_redis
	docker stop dockware-demoshop_db
	docker stop dockware-demoshop_elasticsearch