postgres:
	docker run --rm -e POSTGRES_PASSWORD=password -p 5432:5432 -v $(shell pwd)/db:/docker-entrypoint-initdb.d --name database-postgress postgres
test:
	docker run --rm -e POSTGRES_PASSWORD=password -p 5432:5432 --name database-postgress postgres
start:
	docker exec -it database-postgress psql -h localhost -U postgres
stop:
	docker stop database-postgress
admin:
	docker run --rm \
		-e PGADMIN_DEFAULT_PASSWORD=1234 \
		-e PGADMIN_DEFAULT_EMAIL=a@email.com \
		-p 5000:80 dpage/pgadmin4
