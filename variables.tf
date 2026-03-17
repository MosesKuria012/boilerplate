variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type = string
  sensitive = true
  
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key ID"
  type = string
  sensitive = true
}

variable "region" {
    description = "The region the to create the aws resources in"
    default = "us-east-1"
}

variable "cidr_block" {
  description = "the cidr block of the vpc"
  type = string
  
}

variable "public_subnets" {
  description = "A map of subnets to create the resources in"
  type = map(object({
    cidr_block = string
    availability_zone = string
    is_public = bool
  }))
}

variable "private_subnets" {
  description = "a map of private subnets to create resources in"
  type = map(object({
    cidr_block = string
    availability_zone = string
    is_public = bool
  }))
}