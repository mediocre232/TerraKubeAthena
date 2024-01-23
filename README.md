# AWS Infrastructure Automation with Terraform

This project contains Terraform configurations for deploying and managing AWS resources for a data analysis platform. It provisions an EKS cluster, an EMR cluster, Glue resources for data cataloging, and an Athena database and query for data querying.

## Structure

The Terraform configuration is organized into multiple files for better manageability:

- `provider.tf` - Configures the AWS provider.
- `variables.tf` - Defines variables used across the configurations.
- `athena.tf` - Sets up Athena database and queries for data analysis.
- `eks.tf` - Defines the resources for creating an EKS cluster.
- `emr.tf` - Contains the configuration for an EMR cluster to handle big data processing.
- `glue.tf` - Provisions AWS Glue resources for ETL operations.
- `network.tf` - Sets up networking resources like VPCs and subnets.

## Resources Provisioned

- **Amazon EKS (Elastic Kubernetes Service):** A managed Kubernetes service for running containerized applications.
- **Amazon EMR (Elastic MapReduce):** A cloud-native big data platform for processing vast amounts of data quickly and cost-effectively.
- **AWS Glue:** A fully managed extract, transform, and load (ETL) service that makes it easy to prepare and load data for analytics.
- **Amazon Athena:** An interactive query service that makes it easy to analyze data in Amazon S3 using standard SQL.
- **Networking Resources:** A VPC and subnets to provide a secure and isolated network for the resources.

## Usage

To use these configurations:

1. Ensure you have Terraform installed and configured with the appropriate AWS credentials.
2. Clone the repository to your local machine.
3. Navigate to the cloned directory.
4. Run `terraform init` to initialize the Terraform configuration.
5. Execute `terraform plan` to review the changes that will be applied.
6. If everything looks good, apply the configuration with `terraform apply`.

## Prerequisites

- An AWS account with the necessary permissions to create the resources.
- Terraform v0.12+ installed on your local machine.

## Contributing

Contributions to this project are welcome. Please ensure you update tests as appropriate and adhere to the existing coding conventions.

---

Please note that the actual Terraform configurations and resources provisioned can be adjusted to fit the specific needs of your project and organization.
