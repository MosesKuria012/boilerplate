#VPC Creation
resource "aws_vpc" "day01_vpc" {
    cidr_block = var.cidr_block
    instance_tenancy = "default"   
    enable_dns_hostnames = true   
    enable_dns_support = true

    tags = {
      Name = "Day-01_VPC"
    }
}

#internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.day01_vpc.id
}

#allocating an EIP for the Nat Gateway
resource "aws_eip" "ngw_eip" {
  domain = "vpc"
}

#nat-gateway
resource "aws_nat_gateway" "ngw" {
  
  allocation_id = aws_eip.ngw_eip.id
  subnet_id = values(aws_subnet.public_subnets)[1].id

  depends_on = [ aws_internet_gateway.igw ]
}

#public subnets
resource "aws_subnet" "public_subnets" {
  vpc_id = aws_vpc.day01_vpc.id
  for_each = var.public_subnets
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
}
#private subnets
resource "aws_subnet" "private_subnets" {
  vpc_id = aws_vpc.day01_vpc.id
  for_each = var.private_subnets
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
}

#public routing
resource "aws_route_table" "public_routing" {
  vpc_id = aws_vpc.day01_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

#private routing
resource "aws_route_table" "private_routing" {
  vpc_id = aws_vpc.day01_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
}

#route table associations for the public subnets
resource "aws_route_table_association" "public_associations" {
  for_each = var.public_subnets
  subnet_id = aws_subnet.public_subnets[each.key].id
  route_table_id = aws_route_table.public_routing.id
}

#route table associations for private subnets
resource "aws_route_table_association" "private_associations" {
    for_each = var.private_subnets
  subnet_id = aws_subnet.private_subnets[each.key].id
  route_table_id = aws_route_table.private_routing.id
}