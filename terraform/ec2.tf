resource "aws_key_pair" "deploy_key" {
  key_name   = "deploy_idrsa"
  public_key = file("../deploy_idrsa.pub")
}

resource "aws_security_group" "allow_all" {
  vpc_id      = aws_vpc.my_vpc.id
  name        = "allow_all_traffic"
  description = "Allow all inbound and outbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "reverse_proxy" {
  ami               = "ami-0314c062c813a4aa0"
  instance_type     = "t2.micro"
  key_name          = aws_key_pair.deploy_key.key_name
  availability_zone = "eu-west-3a"
  private_ip       = "192.168.1.54"

  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.allow_all.id]
  subnet_id              = aws_subnet.internal_subnet.id

  root_block_device {
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "Reverse Proxy"
  }
}

resource "aws_instance" "backend1" {
  ami               = "ami-0314c062c813a4aa0"
  instance_type     = "t2.micro"
  key_name          = aws_key_pair.deploy_key.key_name
  availability_zone = "eu-west-3a"
  private_ip       = "192.168.1.50"

  associate_public_ip_address = false

  vpc_security_group_ids = [aws_security_group.allow_all.id]
  subnet_id              = aws_subnet.internal_subnet.id

  root_block_device {
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "Backend 1"
  }
}

resource "aws_instance" "backend2" {
  ami               = "ami-0314c062c813a4aa0"
  instance_type     = "t2.micro"
  key_name          = aws_key_pair.deploy_key.key_name
  availability_zone = "eu-west-3a"
  private_ip       = "192.168.1.51"

  associate_public_ip_address = false

  vpc_security_group_ids = [aws_security_group.allow_all.id]
  subnet_id              = aws_subnet.internal_subnet.id

  root_block_device {
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "Backend 2"
  }
}

resource "aws_instance" "database" {
  ami               = "ami-0314c062c813a4aa0"
  instance_type     = "t2.micro"
  key_name          = aws_key_pair.deploy_key.key_name
  availability_zone = "eu-west-3a"
  private_ip       = "192.168.1.53"

  associate_public_ip_address = false

  vpc_security_group_ids = [aws_security_group.allow_all.id]
  subnet_id              = aws_subnet.internal_subnet.id

  root_block_device {
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "Database"
  }
}

output "reverse_proxy_public_ip" {
  value = aws_instance.reverse_proxy.public_ip
}
