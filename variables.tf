variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "project_name" {
  description = "Name of the project (lowercase, alphanumeric and hyphens only)"
  type        = string
  
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "Project name must be lowercase alphanumeric characters and hyphens only."
  }
}

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for resources"
  type        = list(string)
}

# EC2 Variables
variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
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

variable "ssh_key_name" {
  description = "Name of the SSH key pair in AWS"
  type        = string
}

variable "allowed_ssh_ips" {
  description = "List of IP addresses allowed for SSH access (use your public IP)"
  type        = list(string)
  
  validation {
    condition = alltrue([
      for ip in var.allowed_ssh_ips : can(cidrhost(ip, 0))
    ])
    error_message = "All SSH IPs must be valid CIDR blocks (e.g., 1.2.3.4/32)."
  }
}

variable "owner_email" {
  description = "Email of the resource owner"
  type        = string
  
  validation {
    condition     = can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.owner_email))
    error_message = "Owner email must be a valid email address."
  }
}

variable "ec2_root_volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 30
}