# Basic Configuration
environment = "dev"
project_name = "my-project"

# EC2 Configuration
ec2_instance_type = "t3.micro"
ec2_ami_id        = "ami-0c55b159cbfafe1f0"  # Example AMI ID, replace with actual

# S3 Configuration
s3_bucket_name = "my-first-project-dev-bucket-ig16-june"

# ML Services Configuration
enable_comprehend = false
enable_sagemaker  = false
enable_quicksight = false

# Bedrock Configuration
enable_bedrock = false

# Network Configuration
vpc_id     = "vpc-0b2e99e9d17729d99"  # Replace with actual VPC ID
subnet_ids = ["subnet-0f55444463b70f646", "subnet-04484caf2061ee9c2"]  # Replace with actual subnet IDs 