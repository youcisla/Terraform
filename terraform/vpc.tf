# resource "aws_vpc" "my_vpc" {
#   cidr_block = "192.168.0.0/16"

#   tags = {
#     Name = "my_vpc"
#   }
# }

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_internet_gateway"
  }
}

resource "aws_subnet" "internal_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.1.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "internal"
  }
}

resource "aws_subnet" "external_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "external"
  }
}

resource "aws_nat_gateway" "my_nat_gateway" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.external_subnet.id
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my_route_table"
  }
}

resource "aws_route_table" "my_route_table_2" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my_nat_gateway.id
  }

  tags = {
    Name = "my_route_table_2"
  }
}

resource "aws_route_table_association" "internal_route_table_assoc" {
  subnet_id      = aws_subnet.internal_subnet.id
  route_table_id = aws_route_table.my_route_table_2.id
}
resource "aws_route_table_association" "external_route_table_assoc_2" {
  subnet_id      = aws_subnet.external_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}


resource "aws_network_acl" "my_acl" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "my_acl"
  }
}

resource "aws_network_acl_association" "internal_acl_assoc" {
  subnet_id      = aws_subnet.internal_subnet.id
  network_acl_id = aws_network_acl.my_acl.id
}

resource "aws_network_interface" "my_eni_1" {
  subnet_id       = aws_subnet.external_subnet.id
  private_ips     = ["192.168.2.50"]
  security_groups = [aws_security_group.allow_all.id]

  attachment {
    instance     = aws_instance.reverse_proxy.id
    device_index = 1
  }
}

resource "aws_network_interface" "my_eni_2" {
  subnet_id       = aws_subnet.internal_subnet.id
  private_ips     = ["192.168.1.50"]
  security_groups = [aws_security_group.allow_all.id]

  attachment {
    instance     = aws_instance.backend1.id
    device_index = 1
  }
}

resource "aws_network_interface" "my_eni_3" {
  subnet_id       = aws_subnet.internal_subnet.id
  private_ips     = ["192.168.1.51"]
  security_groups = [aws_security_group.allow_all.id]

  attachment {
    instance     = aws_instance.backend2.id
    device_index = 1
  }
}

resource "aws_network_interface" "my_eni_4" {
  subnet_id       = aws_subnet.internal_subnet.id
  private_ips     = ["192.168.1.53"]
  security_groups = [aws_security_group.allow_all.id]

  attachment {
    instance     = aws_instance.database.id
    device_index = 1
  }
}