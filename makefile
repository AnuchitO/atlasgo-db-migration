# make atlas-schema-inspect
.PHONY: atlas-schema-inspect
atlas-schema-inspect:
	docker-compose run --rm atlas schema inspect --url "$(DOCKER_POSTGRES_URL)" --schema public --format "{{ sql . }}" > ./schema/schema.sql


# make schema-inspect
.PHONY: schema-inspect2
schema-inspect:
	docker-compose run --rm atlas schema inspect --url $(DOCKER_POSTGRES_URL) --schema public > ./schema/schema.sql
