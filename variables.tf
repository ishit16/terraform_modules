variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for resources"
  type        = list(string)
}

variable "ssh_cidr_blocks" {
  description = "List of CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# EC2 Variables
variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

# S3 Variables
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

# ML Services Variables
variable "enable_comprehend" {
  description = "Enable Amazon Comprehend"
  type        = bool
  default     = false
}

variable "enable_sagemaker" {
  description = "Enable Amazon SageMaker"
  type        = bool
  default     = false
}

variable "enable_quicksight" {
  description = "Enable Amazon QuickSight"
  type        = bool
  default     = false
}

variable "comprehend_data_uri" {
  description = "S3 URI for Comprehend training data"
  type        = string
  default     = ""
}

variable "quicksight_admin_email" {
  description = "Email for QuickSight admin user"
  type        = string
  default     = ""
}

# Bedrock Variables
variable "enable_bedrock" {
  description = "Enable Amazon Bedrock"
  type        = bool
  default     = false
}