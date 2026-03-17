aws_access_key_id = ""
aws_secret_access_key = ""
cidr_block = "10.10.0.0/16"
public_subnets = {
  "az-1" = {
    cidr_block = "10.10.0.0/20"
    availability_zone = "us-east-1a"
    is_public = true
  }
  "az-2" = {
    cidr_block = "10.10.16.0/20"
    availability_zone = "us-east-1b"
    is_public = true
  }
  "az-3" = {
    cidr_block = "10.10.32.0/20"
    availability_zone = "us-east-1c"
    is_public = true
  }
}

private_subnets = {
  "az-1" = {
    cidr_block = "10.10.48.0/20"
    availability_zone = "us-east-1a"
    is_public = false
  }

    "az-2" = {
    cidr_block = "10.10.64.0/20"
    availability_zone = "us-east-1b"
    is_public = false
  }

    "az-3" = {
    cidr_block = "10.10.80.0/20"
    availability_zone = "us-east-1c"
    is_public = false
  }
}