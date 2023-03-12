# VPC
resource "aws_vpc" "prod_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prod_vpc.id
  tags = {
    Name = var.gw_name
  }
}

# Creating an elastic IP to associate with Nat Gateway
resource "aws_eip" "nat_eip" {
  depends_on = [aws_internet_gateway.igw]
}

# Create the NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_subnet1.id
  tags = {
    Name = "NAT Gateway"
  }
}

# Create the public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.prod_vpc.id
  route {
    cidr_block = var.all_cidr
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public RT"
  }
}

# Create the private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.prod_vpc.id
  route {
    cidr_block     = var.all_cidr
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "Private RT"
  }
}

# Create the public subnet 1
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.prod_vpc.id
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "Public subnet 1"
  }
}

# Create the public subnet 2
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.prod_vpc.id
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public subnet 2"
  }
}

# Create the private subnet 
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "eu-central-1b"
  tags = {
    Name = "Private subnet"
  }
}