-- Add new schema named "public"
CREATE SCHEMA IF NOT EXISTS "public";
-- Set comment to schema: "public"
COMMENT ON SCHEMA "public" IS 'standard public schema';
-- Create "profile" table
CREATE TABLE "public"."profile" ("id" serial NOT NULL, "name" text NOT NULL, "email" text NULL, "employee_id" text NOT NULL, PRIMARY KEY ("id"));
