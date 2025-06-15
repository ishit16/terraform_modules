output "ec2_instance_id" {
  description = "ID of the created EC2 instance"
  value       = module.ec2.instance_id
}

output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = module.s3.bucket_name
}
