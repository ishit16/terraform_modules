output "ec2_instance_id" {
  description = "ID of the created EC2 instance"
  value       = module.infrastructure.ec2_instance_id
}

output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = module.infrastructure.s3_bucket_name
} 