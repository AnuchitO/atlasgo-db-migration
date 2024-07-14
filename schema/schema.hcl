table "profile" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "name" {
    null = false
    type = text
  }
  column "email" {
    null = true
    type = text
  }
  column "employee_id" {
    null = false
    type = text
  }
  primary_key {
    columns = [column.id]
  }
}
schema "public" {
  comment = "standard public schema"
}
