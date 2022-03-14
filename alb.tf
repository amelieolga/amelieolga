# Create Application Load Balancer Security Group

resource "aws_security_group" "altana_alb_sg" {
  vpc_id = aws_vpc.altana-vpc.id
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  tags = {
    Name        = "Altana ALB Security Group"
    
  } 
}

# Create Application Load Balancer

resource "aws_lb" "altana_alb" {
  name               = "altana-app-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.altana_alb_sg.id]
  subnets = [
    aws_subnet.altana-public-1a.id,
    aws_subnet.altana-public-1b.id,
    aws_subnet.altana-public-1c.id
  ]
  enable_deletion_protection = false
  tags = {
    Name        = "Altana Application Load Balancer"
    Terraform   = "True"   
  } 
}