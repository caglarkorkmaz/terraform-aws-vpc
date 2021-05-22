resource "aws_subnet" "private_subnet1" {
  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr1
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = var.tags
}

resource "aws_subnet" "private_subnet2" {
  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr2
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = var.tags
}

resource "aws_subnet" "private_subnet3" {
  
  vpc_id     = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.available.names[2]
  cidr_block = var.private_cidr3
  tags = var.tags
}



//




resource "aws_eip" "nat" {
  vpc      = true
  tags = var.tags
}



//


resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet1.id
  tags = var.tags
}




//




resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw.id
  }
  tags = var.tags
}



resource "aws_route_table_association" "private1" {
  subnet_id = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private2" {
  subnet_id = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private3" {
  subnet_id = aws_subnet.private_subnet3.id
  route_table_id = aws_route_table.private.id
}

