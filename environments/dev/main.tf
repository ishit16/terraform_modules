terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-ig16"
    key            = "dev/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

module "infrastructure" {
  source = "../.."  # Points to the root module

  # Basic Configuration
  environment = var.environment
  project_name = var.project_name
  owner_email = var.owner_email

  # EC2 Configuration (remove ec2_ami_id - now using data source)
  ec2_instance_type = var.ec2_instance_type
  ec2_root_volume_size = var.ec2_root_volume_size

  # SSH Configuration
  ssh_key_name = var.ssh_key_name
  allowed_ssh_ips = var.allowed_ssh_ips

  # Network Configuration
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids

  # S3 Configuration
  s3_bucket_name = var.s3_bucket_name

  # Optional Services
  enable_comprehend = var.enable_comprehend
  enable_sagemaker = var.enable_sagemaker
  enable_quicksight = var.enable_quicksight
  enable_bedrock = var.enable_bedrock

  # ML Services Configuration
  comprehend_data_uri = var.comprehend_data_uri
  quicksight_admin_email = var.quicksight_admin_email
}