variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "owner_email" {
  description = "Email of the resource owner"
  type        = string
}

# EC2 Variables
variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ec2_root_volume_size" {
  description = "Size of the root volume in GB"
  type        = number
}

# SSH Variables
variable "ssh_key_name" {
  description = "Name of the SSH key pair in AWS"
  type        = string
}

variable "allowed_ssh_ips" {
  description = "List of IP addresses allowed for SSH access"
  type        = list(string)
}

# Network Variables
variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for resources"
  type        = list(string)
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
}

variable "enable_sagemaker" {
  description = "Enable Amazon SageMaker"
  type        = bool
}

variable "enable_quicksight" {
  description = "Enable Amazon QuickSight"
  type        = bool
}

variable "enable_bedrock" {
  description = "Enable Amazon Bedrock"
  type        = bool
}

variable "comprehend_data_uri" {
  description = "S3 URI for Comprehend training data"
  type        = string
}

variable "quicksight_admin_email" {
  description = "Email for QuickSight admin user"
  type        = string
} 