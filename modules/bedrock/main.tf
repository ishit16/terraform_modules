resource "aws_bedrock_model_invocation_logging_configuration" "main" {
  count = var.enable_bedrock ? 1 : 0

  logging_config {
    cloudwatch_config {
      log_group_name = aws_cloudwatch_log_group.bedrock[0].name
    }
    s3_config {
      bucket_name = aws_s3_bucket.bedrock_logs[0].id
    }
  }
}

resource "aws_cloudwatch_log_group" "bedrock" {
  count = var.enable_bedrock ? 1 : 0

  name              = "/aws/bedrock/${var.name}"
  retention_in_days = 30
}

resource "aws_s3_bucket" "bedrock_logs" {
  count = var.enable_bedrock ? 1 : 0

  bucket = "${var.name}-bedrock-logs"
}

resource "aws_iam_role" "bedrock" {
  count = var.enable_bedrock ? 1 : 0

  name = "${var.name}-bedrock-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "bedrock.amazonaws.com"
        }
      }
    ]
  })
} 