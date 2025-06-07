resource "aws_instance" "Public_Web_Template" {
    ami                    = "ami-0a193d0992c7e9119" # replace with your ami id
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.public_web_subnet-1.id
    vpc_security_group_ids = [aws_security_group.webserver_security_group.id] 
    key_name               = "DevOps"   # replace with your exsting private key
    user_data              = file("install_apache.sh") 

    tags ={
        Name               = "web-asg"
    }  
}
// *****************  EC2 INSTANCE APP TIER  ***************** // 

resource "aws_instance" "Private_App_Template" {
    ami                    = "ami-0a193d0992c7e9119" # replace with your ami id
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.private_app_subnet-1.id
    vpc_security_group_ids = [aws_security_group.ssh_security_group.id]
    key_name               = "DevOps"  # replace with your exsting private key

    tags ={
        Name               = "app-asg"
    }
}