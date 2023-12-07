provider "aws" {
  alias = "webapp"
  region = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name      = "shr"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "Hello, World!" > /var/www/html/index.html
              EOF

  tags = {
    Name = "web-server"
  }
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}

