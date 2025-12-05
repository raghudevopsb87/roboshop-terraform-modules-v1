resource "aws_instance" "main" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "test"
  }

}


