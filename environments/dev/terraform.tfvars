# =============================================================================
# AWS INFRASTRUCTURE REQUEST TEMPLATE
# =============================================================================
# Instructions: Copy this file to environments/[your-env]/terraform.tfvars
# and fill in your specific values. Only modify the values, not the structure.
# =============================================================================

# Basic Configuration (REQUIRED)
environment = "dev"                    # Options: dev, staging, prod
project_name = "my-project-is-great"           # Your project name (lowercase, no spaces)
owner_email = "ishitgarg1231@gmail.com" # Your email address

# EC2 Configuration (REQUIRED)
ec2_instance_type = "t3.micro"        # Options: t3.micro, t3.small, t3.medium
ec2_root_volume_size = 30             # Minimum 30GB required

# S3 Configuration (REQUIRED)
s3_bucket_name = "my-unique-bucket-name-2024-ig16"  # Must be globally unique

# SSH Access (REQUIRED)
ssh_key_name = "terraform-project"           # Your SSH key name in AWS
allowed_ssh_ips = ["49.207.215.145/32"]     # Your IP address for SSH access

# Network Configuration (REQUIRED - Contact DevOps team for values)
vpc_id     = "vpc-0b2e99e9d17729d99"          # Get from DevOps team
subnet_ids = ["subnet-0f55444463b70f646", "subnet-04484caf2061ee9c2"]     # Get from DevOps team

# Optional Services (Set to true to enable)
enable_comprehend = false
enable_sagemaker  = false
enable_quicksight = false
enable_bedrock    = false

# Optional: ML Services Configuration (only needed if enabled above)
comprehend_data_uri = ""              # S3 URI for Comprehend data
quicksight_admin_email = ""           # Admin email for QuickSight 