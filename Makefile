# Makefile
setup:
	go mod download
	go mod vendor
	go mod tidy

build:
	docker build --progress=plain -t news-app .

run:
	docker run -p 8080:8080 news-app

buildrun: build
	docker run -p 8080:8080 news-app

up:
	docker-compose  --verbose up

buildup:
	docker-compose --verbose up --build 

deploy: setup
	docker-compose --verbose build