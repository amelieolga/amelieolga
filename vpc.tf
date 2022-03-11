variable "aws-vpc-cidr" {
  type= string
  default="10.0.0.0/16"
}

# Create VPC

resource "aws_vpc" "altana-vpc" {
  cidr_block = var.aws-vpc-cidr
  enable_dns_hostmanes = true
  tags = {
    Name = "Altana VPC"
      }
}