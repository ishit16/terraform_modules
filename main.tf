# Data source for automatic AMI selection
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Validation for required variables
locals {
  # Validate project name
  validate_project_name = regex("^[a-z0-9-]+$", var.project_name)
  
  # Validate environment
  validate_environment = contains(["dev", "staging", "prod"], var.environment)
}

module "ec2" {
  source = "./modules/ec2"

  name           = var.project_name
  ami_id         = data.aws_ami.amazon_linux_2023.id  # Auto-select latest AMI
  instance_type  = var.ec2_instance_type
  subnet_id      = var.subnet_ids[0]
  vpc_id         = var.vpc_id
  ssh_cidr_blocks = var.allowed_ssh_ips  # Use specific IPs, not 0.0.0.0/0
  key_name       = var.ssh_key_name      # Add SSH key

  root_volume_size = var.ec2_root_volume_size
  associate_public_ip_address = var.environment == "dev" ? true : false
  
  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Owner       = var.owner_email
  }
}

module "s3" {
  source = "./modules/s3"

  bucket_name = var.s3_bucket_name
}

module "ml_services" {
  source = "./modules/ml_services"

  name                  = var.project_name
  enable_comprehend     = var.enable_comprehend
  enable_sagemaker      = var.enable_sagemaker
  enable_quicksight     = var.enable_quicksight
  vpc_id               = var.vpc_id
  subnet_ids           = var.subnet_ids
  comprehend_data_uri  = var.comprehend_data_uri
  quicksight_admin_email = var.quicksight_admin_email
}

module "bedrock" {
  source = "./modules/bedrock"

  name          = var.project_name
  enable_bedrock = var.enable_bedrock
}
