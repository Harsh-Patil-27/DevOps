// **************  PUBLIC SUBNET 1  ************** //

resource "aws_subnet" "public_web_subnet-1"{
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = var.public_web_subnet-1-cidr
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name                  = "Public Subnet 1"
  }
}
// **************  PUBLIC SUBNET 2  ************** //

resource "aws_subnet" "public_web_subnet-2" {
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = var.public_web_subnet-2-cidr
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                  = "Public Subnet 2"
  }
}
// **************  PRIVATE SUBNET 1  ************** //

resource "aws_subnet" "private_app_subnet-1" {
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = var.privat_app_subnet-1-cidr
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name                  = "Private Subnet 1 | App Tier"
  }
}
// **************  PRIVATE SUBNET 2  ************** //

resource "aws_subnet" "private_app_subnet-2" {
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = var.private_app_subnet-2-cidr
  map_public_ip_on_launch = false

  tags = {
    Name                  = "Private Subnet 2 | App Tier"
  }
}
// **************  PRIVATE DB SUBNET 1  ************** //

resource "aws_subnet" "private_db_subnet-1" {
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = var.priavte_db_subnet-1-cidr
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name                  = "Private Subnet 1 | DB Tier"
  }
}

// **************  PRIVATE DB SUBNET 2  ************** //
resource "aws_subnet" "private_db_subnet-2" {
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = var.private_db_subnet-2-cidr
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = false

  tags = {
    Name                  = "Private Subnet 2 | DB Tier"
  }
}