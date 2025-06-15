environment = "prod"
project_name = "my-project"

# EC2 Configuration
ec2_instance_type = "t3.micro"
ec2_ami_id        = "ami-0c55b159cbfafe1f0"  # Example AMI ID, replace with actual

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