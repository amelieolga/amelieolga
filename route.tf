# Create a public route table for Public Subnets
 
resource "aws_route_table" "altana-public" {
  vpc_id = aws_vpc.altana-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.altana-igw.id
  }
  tags = {
    Name        = "Altana Public Route Table"
    
    }
}
 
# Attach a public route table to Public Subnets
 
resource "aws_route_table_association" "altana-public-1a-association" {
  subnet_id = aws_subnet.altana-public-1a.id
  route_table_id = aws_route_table.altana-public.id
}
 
resource "aws_route_table_association" "altana-public-1b-association" {
  subnet_id = aws_subnet.altana-public-1b.id
  route_table_id = aws_route_table.altana-public.id
}

resource "aws_route_table_association" "altana-public-1c-association" {
  subnet_id = aws_subnet.altana-public-1c.id
  route_table_id = aws_route_table.altana-public.id
}

# Create first private route table and associate it with private subnet in us-east-1a
 
resource "aws_route_table" "altana_private_route_table_1a" {
    vpc_id = aws_vpc.altana-vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.altana-nat-gateway-1a.id
  }
    tags =  {
        Name      = "Altana Private route table 1A"
        
  }
}
 
resource "aws_route_table_association" "altana-1a" {
    subnet_id = aws_subnet.altana-private-1a.id
    route_table_id = aws_route_table.altana_private_route_table_1a.id
}
 
# Create second private route table and associate it with private subnet in us-east-1b 
 
resource "aws_route_table" "altana_private_route_table_1b" {
    vpc_id = aws_vpc.altana-vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.altana-nat-gateway-1b.id
  }
    tags =  {
        Name      = "Altana Private route table 1B"
        
  }
}
 
resource "aws_route_table_association" "altana-1b" {
    subnet_id = aws_subnet.altana-private-1b.id
    route_table_id = aws_route_table.altana_private_route_table_1b.id
}

# Create second private route table and associate it with private subnet in us-east-1c 
 
resource "aws_route_table" "altana_private_route_table_1c" {
    vpc_id = aws_vpc.altana-vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.altana-nat-gateway-1c.id
  }
    tags =  {
        Name      = "Altana Private route table 1C"
        
  }
}
 
resource "aws_route_table_association" "altana-1c" {
    subnet_id = aws_subnet.altana-private-1c.id
    route_table_id = aws_route_table.altana_private_route_table_1c.id
}