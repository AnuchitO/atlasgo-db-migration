# make atlas-schema-inspect
.PHONY: atlas-schema-inspect
atlas-schema-inspect-sql:
	docker-compose run --rm atlas schema inspect --url "$(DOCKER_POSTGRES_URL)" --schema public --format "{{ sql . }}" > ./schema/schema.sql


# make schema-inspect-hcl
.PHONY: schema-inspect-hcl
atlas-schema-inspect-hcl:
	docker-compose run --rm atlas schema inspect --url $(DOCKER_POSTGRES_URL) --schema public > ./schema/schema.hcl

.PHONY: schema-apply-hcl
atlas-schema-apply-hcl:
	docker-compose run --rm atlas schema apply --url $(DOCKER_POSTGRES_URL)  -f /schema/schema.hcl --dev-url $(DOCKER_SANBOX_POSTGRES_URL)

#  create migrate file [migrate new](https://atlasgo.io/cli-reference#atlas-migrate-new)
#  make migrate-new name=xxxxx
.PHONY: migrate-new
migrate-new:
	docker-compose run --rm atlas migrate new $(name) --dir file://./migrations

# migrate hash [migrate hash](https://atlasgo.io/cli-reference#atlas-migrate-hash)
# make migrate-hash
.PHONY: migrate-hash
migrate-hash:
	docker-compose run --rm atlas migrate hash --dir file://./migrations

# apply migrate file [migrate apply](https://atlasgo.io/cli-reference#atlas-migrate-apply)
# make migrate-apply-dry-run
.PHONY: migrate-apply-dry-run
migrate-apply-dry-run: migrate-hash
	docker-compose run --rm atlas migrate apply --dir file://./migrations --url $(DOCKER_POSTGRES_URL) --dry-run

# apply migrate file [migrate apply](https://atlasgo.io/cli-reference#atlas-migrate-apply)
# make migrate-apply
.PHONY: migrate-apply
migrate-apply:
	docker-compose run --rm atlas migrate apply --dir file://./migrations --url $(DOCKER_POSTGRES_URL)

# allow dirty
# make migrate-apply-dirty
.PHONY: migrate-apply-dirty
migrate-apply-dirty:
	docker-compose run --rm atlas migrate apply --dir file://./migrations --url $(DOCKER_POSTGRES_URL) --allow-dirty