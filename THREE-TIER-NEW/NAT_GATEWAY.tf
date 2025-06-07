// *************  NAT GATEWAY  ************* //
resource "aws_eip" "eip_nat"{

    tags = {
     
      Name = "eip1"
    }
}
resource "aws_nat_gateway" "nat_1"{
   allocation_id = aws_eip.eip_nat.id
   subnet_id     = aws_subnet.public_web_subnet-2.id

   tags = {
   
     Name = "nat1"
   }
}    