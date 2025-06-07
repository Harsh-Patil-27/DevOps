resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc_01.id

  tags = {
    Name = "Test IGW"
  }
}