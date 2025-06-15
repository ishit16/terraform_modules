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

  environment = var.environment
  project_name = var.project_name
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  ec2_ami_id = var.ec2_ami_id
  ec2_instance_type = var.ec2_instance_type
  s3_bucket_name = var.s3_bucket_name
  enable_comprehend = var.enable_comprehend
  enable_sagemaker = var.enable_sagemaker
  enable_quicksight = var.enable_quicksight
  enable_bedrock = var.enable_bedrock
}