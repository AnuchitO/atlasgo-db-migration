atlas schema inspect -u "mysql://root:pass@localhost:3306/example" > schema.hcl

// plan schema
atlas schema apply \
  -u "mysql://root:pass@localhost:3306/example" \
  --to file://schema.hcl \
  --dry-run

// up
atlas schema apply \
  -u "mysql://root:pass@localhost:3306/example" \
  --to file://schema.hcl

// create migration file
atlas migrate new file_name \
	--dir "file://migrations"

// create check sum hash after change migration file
atlas migrate hash \
  --dir "file://migrations"

// apply migration
atlas migrate apply \
  --dir "file://migrations" \
  --url "docker://mysql/8/example"

// apply migration with baseline
atlas migrate apply \
  --dir "file://migrations" \
  --url "mysql://root:pass@localhost:3306/example" \
	--baseline 20230730144426

// down
atlas schema apply \
  --url "mysql://root:pass@localhost:3306/example" \
  --to "file://migrations?version=20230730113624" \
  --dev-url "docker://mysql/8/example" \
  --exclude "atlas_schema_revisions"


// it can detect change in migration folder if someone delete any file
the check sum will different
## TODO:
- [x] Migration: up with Atlasgo
- [x] create migration file
- [x] Migration: down with Atlasgo (https://atlasgo.io/versioned/apply#down-migrations)
	- [x] migration down with version
	- [ ] how can we make sure when it run down migration it will not delete data?
- [ ] column name have doupliate date "AnuchitO" how to fix in Atlasgo?
- [ ] how to control step-by-step migration? e.g. table A -> table B -> table C
- [ ] multi-tenant migration