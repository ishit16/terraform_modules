# Comprehend
resource "aws_comprehend_document_classifier" "main" {
  count = var.enable_comprehend ? 1 : 0

  data_access_role_arn = aws_iam_role.comprehend[0].arn
  input_data_config {
    data_format = "CSV"
    s3_uri      = var.comprehend_data_uri
  }
  language_code = "en"
  name          = "${var.name}-classifier"
}

# SageMaker
resource "aws_sagemaker_domain" "main" {
  count = var.enable_sagemaker ? 1 : 0

  domain_name = "${var.name}-domain"
  auth_mode   = "IAM"
  vpc_id      = var.vpc_id
  subnet_ids  = var.subnet_ids

  default_user_settings {
    execution_role = aws_iam_role.sagemaker[0].arn
  }
}

# QuickSight
resource "aws_quicksight_user" "main" {
  count = var.enable_quicksight ? 1 : 0

  email         = var.quicksight_admin_email
  identity_type = "IAM"
  user_role     = "ADMIN"
  user_name     = "${var.name}-admin"
}

# IAM Roles
resource "aws_iam_role" "comprehend" {
  count = var.enable_comprehend ? 1 : 0

  name = "${var.name}-comprehend-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "comprehend.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role" "sagemaker" {
  count = var.enable_sagemaker ? 1 : 0

  name = "${var.name}-sagemaker-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
      }
    ]
  })
} 