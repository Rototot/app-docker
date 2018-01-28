include .env

help:
	@echo "CURRENT APP_ENV=$(APP_ENV)"
	@echo "RUN 'make install' for install app"
	@echo "RUN 'make run' for run app"
	@echo "RUN 'make update' for update app"
	@echo "RUN 'make stop' for stop app"

#install before first run for init data
install: docker-build docker-up init-db composer-install migrate-up docker-down

#update data in exists app
update: docker-build docker-up composer-install migrate-up docker-down

#run app
run: docker-up composer-install migrate-up

#stop app
stop: docker-down

#helpers
docker-build:
	docker-compose build

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

composer-install:
	docker-compose exec -u www-data php bash -c "composer install -d=/var/www/app"

composer-update:
	docker-compose exec -u www-data php bash -c "composer update -d=/var/www/app"

migrate-up:
	docker-compose exec php bash -c "php /var/www/app/yii migrate --interactive=0"

init-db:
	docker-compose exec -u postgres postgres bash -c "psql -c 'CREATE DATABASE ${DB_NAME};'";