up:
	docker compose up -d
up-build:
	docker compose up -d --build
up-build-log:
	docker compose up --build
down:
	docker compose down
start:
	docker compose start
stop:
	docker compose stop
log:
	docker compose logs -f
ps:
	docker compose ps
