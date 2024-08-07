
# NOTE:

-- add position column to profile table
ALTER TABLE
	profile
ADD
	COLUMN position VARCHAR(255) NOT NULL;

make migrate-apply-dry-run
it will show error
```bash
Migrating to version 20240807085730 from 20240807085402 (1 migrations in total):

  -- migrating version 20240807085730
    -> ALTER TABLE
        profile
       ADD
        COLUMN position VARCHAR(255) NOT NULL;
    pq: column "position" of relation "profile" contains null values

  -------------------------
  -- 16.616035ms
  -- 1 migration with errors
  -- 1 sql statement with errors
Error: sql/migrate: executing statement "ALTER TABLE\n\tprofile\nADD\n\tCOLUMN position VARCHAR(255) NOT NULL;" from version "20240807085730": pq: column "position" of relation "profile" contains null values
sql/migrate: write revision: pq: current transaction is aborted, commands ignored until end of transaction block
make: *** [migrate-apply] Error 1
```