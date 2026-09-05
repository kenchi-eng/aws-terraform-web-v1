resource "aws_vpc" "portfolio" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "portfolio-vpc"
  }
}

resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.portfolio.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = { Name = "portfolio-public-1a" }
}

resource "aws_subnet" "public_1c" {
  vpc_id                  = aws_vpc.portfolio.id
  availability_zone       = "ap-northeast-1c"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true

  tags = { Name = "portfolio-public-1c" }
}

resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.portfolio.id
  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.11.0/24"

  tags = { Name = "portfolio-private-1a" }
}

resource "aws_subnet" "private_1c" {
  vpc_id            = aws_vpc.portfolio.id
  availability_zone = "ap-northeast-1c"
  cidr_block        = "10.0.12.0/24"

  tags = { Name = "portfolio-private-1c" }
}

resource "aws_internet_gateway" "portfolio" {
  vpc_id = aws_vpc.portfolio.id

  tags = { Name = "portfolio-igw" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.portfolio.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.portfolio.id
  }

  tags = { Name = "portfolio-public-rt" }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.portfolio.id

  tags = { Name = "portfolio-private-rt" }
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_1c" {
  subnet_id      = aws_subnet.private_1c.id
  route_table_id = aws_route_table.private.id
}
