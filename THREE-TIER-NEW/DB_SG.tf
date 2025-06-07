// *************  SG DB TIER  ************* //
resource "aws_security_group" "database_security_group" {
    name        ="Database server security group"
    description = "Enable MYSQL access on port 3306"
    vpc_id      = aws_vpc.vpc_01.id

    ingress{
        description = "MYSQL access"
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp" 
        security_groups = [aws_security_group.webserver_security_group.id]
    }
    egress{
        from_port   = 0
        to_port     = 0
        protocol    = "-1" 
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Database Security group"
    }
}