# Demo AtlasGo Database Migration

This is a simple demo to show how to use database migration in a project.

## Challenges
the table `profile` has been created with the following columns:
id, name, email and employee_id. we need some changes in the table.

### Steps:
1. inspect the table `profile` to sql file.
```bash
atlas schema apply --url "$DOCKER_POSTGRES_URL" --to "file://schema/schema.sql" --exclude "atlas_schema_revisions"
```
1. schema migrate add the constraints to column `employee_id` to be unique, six digit and numeric only.
1. schema migrate add a new column `role` to the table `profile` with the type `varchar(50)`.
1. migrate data to new column `first_name` and `last_name` from column `name`.
   1. add new columns `first_name` and `last_name` to the table `profile.sql`.
	 1. run `atlas migrate diff --env local --url "$DOCKER_POSTGRES_URL" --dir "schema/migrations" --to "file://schema/schema.sql" --exclude "atlas_schema_revisions"`
	 1. got new migration file `schema/migrations/xxxxx.sql`
	 1. adjust backfill data in the migration file for `first_name` and `last_name`.
	 1. run `atlas migrate hash --env local --dir "schema/migrations"`
1. migrate testing
	1. create new file `schema/migrate.test.hcl` and add test cases.
	1. run `atlas migrate test --env local --dir "schema/"`
1. Test edge cases "first middle last"
	1. run `atlas migrate test --env local --dir "schema/" --run "name_split_middle_name"`
  1. fix migration file `schema/migrations/xxxxx.sql` to handle edge cases.
	1. run `atlas migrate test --env local --dir "schema/" --run "name_split_middle_name"`

## Curiouse
1. how about delete column `name`?
1. how to migrate data type from `text` to `varchar`?
1. how to test all the migrations in the local environment before deploying to production?
1. mysql> ALTER TABLE `example`.`orders` ADD UNIQUE INDEX `idx_name` (`name`);
`ERROR 1062 (23000): Duplicate entry 'atlas' for key 'orders.idx_name'`

# References:
- https://atlasgo.io/cli-reference#atlas-schema-inspect
- https://atlasgo.io/blog/2021/11/25/meet-atlas
- https://atlasgo.io/lint/analyzers
