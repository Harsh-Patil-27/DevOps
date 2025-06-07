 // ***********  ASG FOR PRESENTATION TIER  *********** //

resource "aws_launch_template" "auto_scaling_group" {
    name_prefix        = "auto-scaling-group"
    image_id           = "ami-0a193d0992c7e9119" # replace with your ami id
    instance_type      = "t2.micro"
    user_data          = filebase64("install_apache.sh") 
    key_name           = "DevOps"  # replace with your exsting private key
    
    network_interfaces {
      subnet_id        = aws_subnet.public_web_subnet-1.id
      security_groups = [aws_security_group.webserver_security_group.id]

    }
  
}
resource "aws_autoscaling_group" "asg-1" {
    availability_zones = ["ap-south-1a"]
    desired_capacity   = 1
    max_size           = 2
    min_size           = 1 
  
  launch_template {
    id                 = aws_launch_template.auto_scaling_group.id
    version            = "$Latest" 
  }
}
 // *************  ASG FOR APPLICATION TIER  ************* //

resource "aws_launch_template" "auto_scaling_group_private" {
    name_prefix        = "auto-scaling-group-private"
    image_id           = "ami-0a193d0992c7e9119"  # replace with your ami id
    instance_type      = "t2.micro"
    key_name           = "DevOps" # replace with your exsting private key

    network_interfaces {
      subnet_id        =   aws_subnet.private_app_subnet-1.id
      security_groups  =  [aws_security_group.ssh_security_group.id]
    }
}
resource "aws_autoscaling_group" "asg-2" {
   availability_zones  = ["ap-south-1a"]
   desired_capacity    = 1 
   max_size            = 2 
   min_size            = 1

    launch_template {
      id               = aws_launch_template.auto_scaling_group_private.id
      version          = "$Latest"
    }
}