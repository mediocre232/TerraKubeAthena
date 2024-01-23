module "eks_cluster" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = "my-cluster"
  cluster_version = "1.22"  // Update to a supported version

  vpc_id          = aws_vpc.main.id
  subnets         = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  node_groups = {
    example = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      instance_type    = "m5.large"
      key_name         = var.key_name
    }
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
}
