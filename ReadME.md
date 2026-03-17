
# terraform-aws-vpc

--terraform version

Terraform v1.14.0
on linux_amd64
+ provider registry.terraform.io/hashicorp/aws v6.36.0

Your version of Terraform is out of date! The latest version
is 1.14.7. You can update by downloading from https://developer.hashicorp.com/terraform/install


--aws sts get-caller-identity

<img width="813" height="516" alt="image" src="https://github.com/user-attachments/assets/d8eba3b3-5d2c-4dec-aa20-8205cdf9c458" />


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

VPC
<img width="1622" height="841" alt="image" src="https://github.com/user-attachments/assets/a480a758-a71e-4c98-8dde-9ad2688648fc" />

Subnets

<img width="1617" height="344" alt="image" src="https://github.com/user-attachments/assets/d060f6b4-733f-46b9-9426-ac2cfa135021" />

Route Table Nat Gateway

<img width="1587" height="500" alt="image" src="https://github.com/user-attachments/assets/ca3156c3-1c7a-4776-a468-ede882cdac19" />

Route Table IGW

<img width="1604" height="435" alt="image" src="https://github.com/user-attachments/assets/2f516eb4-499a-4e5f-aee6-f2b5094beaed" />

Internet Gateway
<img width="1102" height="749" alt="image" src="https://github.com/user-attachments/assets/05e2aa5d-f59e-40e2-b0b4-984f8c97a00f" />

Nat Gateway

<img width="1599" height="854" alt="image" src="https://github.com/user-attachments/assets/659bdd04-eca6-46ea-af16-e34e0ced9f15" />














