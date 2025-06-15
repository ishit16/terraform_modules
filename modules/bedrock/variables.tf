variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "enable_bedrock" {
  description = "Enable Amazon Bedrock"
  type        = bool
  default     = false
} 