# AWS Infrastructure Self-Service

This repository provides self-service AWS infrastructure provisioning through GitLab CI/CD.

## 🚀 Quick Start (For Users)

### Step 1: Request Infrastructure

1. **Fork this repository** or create a new branch
2. **Copy the template**:
   ```bash
   cp templates/terraform.tfvars.example environments/[your-env]/terraform.tfvars
   ```
3. **Fill in your values** in the `terraform.tfvars` file (this is the ONLY file you need to modify)
4. **Create a Merge Request**

### Step 2: What You Need to Provide

- **Project name**: Unique identifier for your resources
- **Environment**: dev, staging, or prod
- **SSH key name**: Your SSH key in AWS (contact DevOps if you don't have one)
- **Your public IP**: For secure SSH access
- **S3 bucket name**: Must be globally unique

### Step 3: Get Your Resources

- Once your MR is approved and merged, resources will be automatically created
- You'll receive the connection details in the pipeline output

## 💰 Cost Estimates

- **EC2 t3.micro**: ~£8/month (Free tier: 750 hours/month)
- **S3 storage**: ~£0.02/GB/month (Free tier: 5GB)
- **EBS storage**: ~£0.08/GB/month (Free tier: 30GB)

## 🔒 Security Features

- All resources encrypted by default
- SSH access restricted to your IP only
- Automatic security group configuration
- IAM roles with minimal permissions

## 📋 Available Services

- ✅ EC2 instances (Amazon Linux 2023)
- ✅ S3 buckets (with versioning and encryption)
- ✅ ML services (Comprehend, SageMaker, QuickSight)
- ✅ Amazon Bedrock

## 🆘 Support

- **Slack**: #devops-support
- **Email**: devops@company.com
- **Documentation**: [Internal Wiki Link]

## 🚫 What NOT to Do

- Don't modify any files except `terraform.tfvars`
- Don't use `0.0.0.0/0` for SSH access
- Don't hardcode sensitive values
- Don't bypass the approval process
