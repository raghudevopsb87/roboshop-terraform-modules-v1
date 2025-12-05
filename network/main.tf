resource "aws_security_group" "main" {
  name        = "roboshop-allow-all"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "roboshop-allow-all"
  }
}

