variable "name" {
  description = "Name prefix for resources"
  type        = string
}

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

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for resources"
  type        = list(string)
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