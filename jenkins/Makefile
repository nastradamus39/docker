start:
	docker compose up -d

reset:
	docker compose stop && \
    docker compose down -v && \
    docker compose down --rmi all && \
    docker compose build --no-cache && \
    docker compose up -d

up:
	docker compose build --no-cache && \
	docker compose up -d

clean:
	docker compose stop && \
	docker compose down -v && \
	docker compose down --rmi all
