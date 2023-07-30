atlas schema inspect -u "mysql://root:pass@localhost:3306/example" > schema.hcl

atlas migrate diff create_blog_posts \
  --dir "file://migrations" \
  --to "file://schema.hcl" \
  --dev-url "docker://mysql/8/example"
