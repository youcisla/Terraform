# Reverse Proxy EC2 instance
resource "aws_instance" "reverse_proxy" {
  ami           = "ami-0314c062c813a4aa0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deploy_key.key_name
  availability_zone = "eu-west-3a"

  # Associate a public IP
  associate_public_ip_address = true

  # Attach security group and specify subnet
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  subnet_id = aws_subnet.internal.id  # Use subnet_id directly

  # Root block device configuration
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "Reverse Proxy"
  }
}

# Backend 1 EC2 instance
resource "aws_instance" "backend1" {
  ami           = "ami-0314c062c813a4aa0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deploy_key.key_name
  availability_zone = "eu-west-3a"

  # No public IP address
  associate_public_ip_address = false

  # Attach security group and specify subnet
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  subnet_id = aws_subnet.internal.id  # Use subnet_id directly

  # Root block device configuration
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "Backend 1"
  }
}

# Backend 2 EC2 instance
resource "aws_instance" "backend2" {
  ami           = "ami-0314c062c813a4aa0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deploy_key.key_name
  availability_zone = "eu-west-3a"

  # No public IP address
  associate_public_ip_address = false

  # Attach security group and specify subnet
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  subnet_id = aws_subnet.internal.id  # Use subnet_id directly

  # Root block device configuration
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "Backend 2"
  }
}

# Database EC2 instance
resource "aws_instance" "database" {
  ami           = "ami-0314c062c813a4aa0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deploy_key.key_name
  availability_zone = "eu-west-3a"

  # No public IP address
  associate_public_ip_address = false

  # Attach security group and specify subnet
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  subnet_id = aws_subnet.internal.id  # Use subnet_id directly

  # Root block device configuration
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "Database"
  }
}

# Output the public IP of the Reverse Proxy
output "reverse_proxy_public_ip" {
  value = aws_instance.reverse_proxy.public_ip
}
