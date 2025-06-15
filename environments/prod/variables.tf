variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ec2_ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}


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

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for resources"
  type        = list(string)
} 