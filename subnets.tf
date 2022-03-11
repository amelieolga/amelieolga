# Create Public Subnets

resource "aws_subnet" "altana-public-1a" {
  vpc_id = aws_vpc.altana-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "Altana Pblic Subnet - 1A"
  }
}

resource "aws_subnet" "Altana-public-1b" {
  vpc_id = aws_vpc.altana-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "Altana Pblic Subnet - 1B"
    
  }
}

resource "aws_subnet" "altana-public-1c" {
  vpc_id = aws_vpc.altana-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "Altana Pblic Subnet - 1C"
    
  }

}


# Create Private Subnets


resource "aws_subnet" "altana-private-1a" {
  vpc_id = aws_vpc.altana-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "false"
  tags = {
    Name        = "Altana Private Subnet - 1A"
  }
  
}

resource "aws_subnet" "Altana-private-1b" {
  vpc_id = aws_vpc.altana-vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "false"
  tags = {
    Name        = "Altana Private Subnet - 1B"
    
  }
}
  resource "aws_subnet" "Altana-private-1c" {
  vpc_id = aws_vpc.altana-vpc.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = "false"
  tags = {
    Name        = "Altana Private Subnet - 1C"
    
  }
}