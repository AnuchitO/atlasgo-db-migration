# Demo using Database Migration

This is a simple demo to show how to use database migration in a project.

## Prerequisites
- docker and docker-compose installed
- [direnv](https://direnv.net/) installed and [configured](https://direnv.net/man/direnv.toml.1.html#codeloaddotenvcode) load `.env` file


## Challenge
the table `profile` has been created with the following columns:
id, name, email and employee_id. we need some changes in the table.

1. [ ] add a new colum `role` to the table `profile` with the type `varchar(50)`.
1. [ ] add new constraint to the column `employee_id` to be unique. explain the verification process. how to check if the constraint is added successfully.
1. [ ] we want to split the column `name` into two columns `first_name` and `last_name`. how to do that without losing the data and explain the verification process.
1. [ ] explain how to test all the migrations in the local environment before deploying to production.