# AWS Infrastructure as Code

This repository contains Terraform configurations for deploying various AWS services including EC2, S3, ML services (Comprehend, SageMaker, QuickSight), and Bedrock.

## Prerequisites

- Terraform >= 1.0.0
- AWS CLI configured with appropriate credentials
- Git

## Usage

1. Clone this repository
2. Create a new branch for your changes
3. Copy the example environment configuration:
   ```bash
   cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars
   ```
4. Edit the `terraform.tfvars` file with your specific values
5. Initialize Terraform:
   ```bash
   terraform init
   ```
6. Plan your changes:
   ```bash
   terraform plan
   ```
7. Apply your changes:
   ```bash
   terraform apply
   ```

## Module Structure

- `modules/ec2`: EC2 instance configuration
- `modules/s3`: S3 bucket configuration
- `modules/ml_services`: ML services configuration
- `modules/bedrock`: Bedrock configuration

## Contributing

1. Create a new branch for your changes
2. Make your changes
3. Submit a merge request
4. Ensure all tests pass
5. Get code review approval
6. Merge your changes

## Security

- All resources are created with encryption enabled
- IAM roles follow the principle of least privilege
- Security groups are configured with minimal required access
