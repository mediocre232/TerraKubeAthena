resource "aws_athena_database" "my_athena_database" {
  name   = "my_athena_database"
  bucket = aws_s3_bucket.my_athena_results.bucket
}

resource "aws_athena_named_query" "my_query" {
  name     = "my_query"
  database = aws_athena_database.my_athena_database.name
  query    = "SELECT * FROM my_table LIMIT 10;"
}
