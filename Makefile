up:
	docker-compose up
upd:
	docker-compose up -d
up:
	docker-compose up -d
build_up:
	docker-compose up -d --build
in:
	docker-compose exec app sh
down:
	docker-compose down
nextjs_install:
	docker-compose exec app yarn create next-app . --typescript 