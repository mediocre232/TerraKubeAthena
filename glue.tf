resource "aws_glue_catalog_database" "my_glue_database" {
  name = "my_glue_database"
}

resource "aws_glue_crawler" "my_crawler" {
  name          = "my-crawler"
  database_name = aws_glue_catalog_database.my_glue_database.name
  role          = aws_iam_role.glue_service_role.arn

  s3_target {
    path = "s3://my-glue-bucket/data/"
  }
}

resource "aws_iam_role" "glue_service_role" {
  name = "glue_service_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "glue.amazonaws.com"
        }
      },
    ]
  })
}
