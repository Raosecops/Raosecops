

resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = { Name = "NebulaGuard-VPC" }
}

resource "aws_subnet" "web_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = { Name = "NebulaGuard-Web-Subnet" }
}

resource "aws_subnet" "app_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
  tags = { Name = "NebulaGuard-App-Subnet" }
}

resource "aws_subnet" "db_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = false
  tags = { Name = "NebulaGuard-DB-Subnet" }
}
