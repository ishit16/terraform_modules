terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "prod/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

module "infrastructure" {
  source = "../.."  # Points to the root module

  environment = "prod"
  project_name = "my-project"

  # EC2 Configuration
  ec2_instance_type = "t3.micro"
  ec2_ami_id  = "ami-00543daa0ad4d3ea4"  # Example AMI ID, replace with actual"  # Example AMI ID, replace with actual

  # S3 Configuration
  s3_bucket_name = "my-project-prod-bucket"

  # ML Services Configuration
  enable_comprehend = true
  enable_sagemaker  = true
  enable_quicksight = true

  # Bedrock Configuration
  enable_bedrock = true

  # Network Configuration
  vpc_id     = "vpc-xxxxxxxx"  # Replace with actual VPC ID
  subnet_ids = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]  # Replace with actual subnet IDs
} 