module "ec2" {
  source = "./modules/ec2"

  name           = var.project_name
  ami_id         = var.ec2_ami_id
  instance_type  = var.ec2_instance_type
  subnet_id      = var.subnet_ids[0]
  vpc_id         = var.vpc_id
  ssh_cidr_blocks = var.ssh_cidr_blocks

  # Add these optional parameters with default values
  root_volume_size = 8
  associate_public_ip_address = true
  enable_detailed_monitoring = false
  ebs_optimized = false
  source_dest_check = true
  disable_api_termination = false
  instance_initiated_shutdown_behavior = "stop"
  tags = {
    Environment = var.environment
    Project     = var.project_name
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
