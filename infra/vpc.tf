resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"  
  tags = {
    Name = "Tech vpc"
  }
}

data "aws_availability_zones" "available_zones" {}

resource "aws_subnet" "subnet_az1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  tags = {
    Name = "Tech subnet 1"
  }
}

resource "aws_subnet" "subnet_az2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  tags = {
    Name = "Tech subnet 1"
  }
}
# create the subnet group for the rds instance
resource "aws_db_subnet_group" "database_subnet_group" {
  name         = "database-subnets"
  subnet_ids   = [aws_subnet.subnet_az1.id,aws_subnet.subnet_az2.id]
  description  = "subnets for database instance"

  tags   = {
    Name = "database-subnets"
  }
}

 resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "internet-gateway-terraform"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    Name = "route_table-terraform"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet_az1.id
  route_table_id = aws_route_table.route_table.id
}
