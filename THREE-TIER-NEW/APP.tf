// *********** SG APPLICATION TIER  (BASTING HOST) ***********  //

resource "aws_security_group" "ssh_security_group" {
  name          = "SSH Access"
  description   = "Enable ssh access on port 22"
  vpc_id        = aws_vpc.vpc_01.id

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_locate]  # Use the variable as a list here
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"              # protocol should be string "-1" for all
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "ssh security group"
  }
}