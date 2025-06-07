// ***********  DATABSEE SUBNET GROUP  *********** //

resource "aws_db_subnet_group" "database_subnet_group" {
    name                   = "database subnet"
    subnet_ids             = [aws_subnet.private_db_subnet-1.id, aws_subnet.private_db_subnet-2.id]
    description            = "Subnet group for database instance" 

    tags = {
      Name                 = "Database Subnet"
    }
}
// *************  DATABASE INSTANCE  ************* //

resource "aws_db_instance" "database_instance" {
    allocated_storage      = 10
    engine                 = "mysql"
    engine_version         =  "8.0"
    instance_class         =  var.database_instance_class
    db_name                = "sqldb"
    username               = "username"  # give your specified username
    password               = "password"  # give youe specified password
    parameter_group_name   = "default.mysql8.0"
    skip_final_snapshot    = true
    availability_zone      = "ap-south-1b" 
    db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
    multi_az               = var.multi_az_deployment
    vpc_security_group_ids = [aws_security_group.database_security_group.id]
}