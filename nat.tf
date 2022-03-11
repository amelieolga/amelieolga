# CREATE ELASTIC IP ADDRESS FOR NAT GATEWAY

  resource "aws_eip" "altana-nat1" {
}
  resource "aws_eip" "altana-nat2" {
}
 resource "aws_eip" "altana-nat3" {
} 

# CREATE NAT GATEWAY in US-East-1A

  resource "aws_nat_gateway" "altana-nat-gateway-1a" {
  allocation_id = aws_eip.altana-nat1.id
  subnet_id     = aws_subnet.altana-public-1a.id

  tags = {
    Name        = "Nat Gateway-1a"
    
  }
}

# CREATE NAT GATEWAY in US-East-1B

resource "aws_nat_gateway" "altana-nat-gateway-1b" {
  allocation_id = aws_eip.altana-nat2.id
  subnet_id     = aws_subnet.altana-public-1b.id

  tags = {
    Name        = "Nat Gateway-1b"
    
  }
}

# CREATE NAT GATEWAY in US-East-1C

resource "aws_nat_gateway" "altana-nat-gateway-1c" {
  allocation_id = aws_eip.altana-nat3.id
  subnet_id     = aws_subnet.altana-public-1c.id

  tags = {
    Name        = "Nat Gateway-1c"
    
  }
}