up:
	docker-compose up -d && \
	docker run gpro npm install

reset:
	docker-compose stop && \
    docker-compose down -v && \
    docker-compose down --rmi all && \
    docker-compose build --no-cache && \
    docker-compose up -d && \
    docker run gpro npm install

install:
	docker run gpro npm install
