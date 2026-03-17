
# terraform-aws-vpc

Terraform template to provision a VPC and core networking components on AWS.

terraform-aws-vpc/
├── main.tf
├── variables.tf
├── terraform.tfvars          
├── outputs.tf                
├── providers.tf
└── README.md

## Resources Provisioned
- VPC in US-EAST-1
- 3 Availability zones
- 3 Public subnets
- 3 Private Subnets
- Internet Gateway
- 1 Nat gateway
- Route Tables
- Route Table associations

## Prerequisites
- Terraform >= 1.x
- AWS CLI configured (`aws configure`)
- IAM permissions for VPC provisioning

## Usage
```bash
# 1. Clone the repo
git clone https://github.com/YOUR_USERNAME/terraform-aws-vpc.git
cd terraform-aws-vpc

# 2. Copy and edit the example vars file
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values

# 3. Initialise and apply
terraform init
terraform plan
terraform apply
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| aws_region | AWS region to deploy into | string | us-east-1 |
| vpc_cidr | CIDR block for the VPC | string | 10.10.0.0/16 |


