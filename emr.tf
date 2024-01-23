resource "aws_emr_cluster" "my_emr_cluster" {
  name          = "my-emr-cluster"
  release_label = "emr-6.3.0"
  applications  = ["Spark", "Hadoop", "Hive"]

  ec2_attributes {
    subnet_id        = aws_subnet.subnet1.id
    instance_profile = aws_iam_instance_profile.emr_profile.arn
  }

  master_instance_group {
    instance_type = "m5.xlarge"
  }

  core_instance_group {
    instance_count = 1
    instance_type  = "m5.xlarge"
  }

  service_role = aws_iam_role.emr_service_role.arn
}

resource "aws_iam_instance_profile" "emr_profile" {
  name = "emr_profile"
  role = aws_iam_role.emr_service_role.name
}

resource "aws_iam_role" "emr_service_role" {
  name = "emr_service_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "elasticmapreduce.amazonaws.com"
        }
      },
    ]
  })
}
