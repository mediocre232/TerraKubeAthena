resource "aws_s3_bucket" "my_athena_results" {
  bucket = "my-unique-athena-results-bucket"  // Use a unique name
}

resource "aws_s3_bucket_acl" "my_athena_results_acl" {
  bucket = aws_s3_bucket.my_athena_results.id
  acl    = "private"
}
