resource "aws_route_table" "public_aws_route_table" {
   vpc_id          = aws_vpc.vpc_01.id

   route {
    cidr_block     = "0.0.0.0/0"
    gateway_id     = aws_internet_gateway.IGW.id 
   }
   tags ={ 
   
      Name         = "Public Route Table"
   }
}
// ***********  ROUTE TABLE ASSOCIATION  *********** //

resource "aws_route_table_association" "public_subnet-1-route_table_association" {
    subnet_id      = aws_subnet.public_web_subnet-1.id
    route_table_id = aws_route_table.public_aws_route_table.id
  
}
// ***********  PRIVATE ROUTE TABLE  *********** //

resource "aws_route_table" "private_route_table" {
  vpc_id           = aws_vpc.vpc_01.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_1.id
  }

  tags = {
    Name           = "Private Route Table"
  }
}
// ***********  ROUTE TABLE ASSOCIATION FOR APP TIER  *********** //

resource "aws_route_table_association" "nat_route-1" {
    subnet_id      = aws_subnet.private_app_subnet-1.id
    route_table_id = aws_route_table.public_aws_route_table.id
}
resource "aws_route_table_association" "nat_route-2" {
    subnet_id      = aws_subnet.private_app_subnet-2.id
    route_table_id = aws_route_table.private_route_table.id
}
// ***********  ROUTE TABLE ASSOCIATION FOR DB TIER  *********** //

resource "aws_route_table_association" "nat_route_db-1" {
    subnet_id      = aws_subnet.private_db_subnet-2.id
    route_table_id = aws_route_table.private_route_table.id
}