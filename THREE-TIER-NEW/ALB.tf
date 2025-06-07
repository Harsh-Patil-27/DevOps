// ****************   WEB APP LOAD BALANCER   **************** //

resource "aws_lb" "application_load_balancer" {
  name                       = "web-external-load-balancer"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_security_group.id]
  subnets                    = [aws_subnet.public_web_subnet-1.id, aws_subnet.public_web_subnet-2.id]
  enable_deletion_protection = false

  tags = {
    Name                     = "App load balancer"
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name                        = "app-load-balancer"
  port                        = 80
  protocol                    = "HTTP"
  vpc_id                      = aws_vpc.vpc_01.id
}

resource "aws_lb_target_group_attachment" "web_attachment" {
  target_group_arn            = aws_lb_target_group.alb_target_group.arn
  target_id                   = aws_instance.Public_Web_Template.id
  port                        = 80
}

resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn          = aws_lb.application_load_balancer.arn
  port                       = 80
  protocol                   = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port                   = "443"
      protocol               = "HTTPS"
      status_code            = "HTTP_301"
    }
  }
}