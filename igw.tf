resource "aws_internet_gateway" "altana-igw" {
  vpc_id = aws_vpc.altana-vpc.id
  tags = {
    Name        = "Altana Internet Gateway"
      }
}