resource "aws_instance" "ares" {
  instance_type = var.instance_type
  ami           = "ami-019715e0d74f695be"
  key_name      = var.key_name
  tags = {
    Name        = "Flask-Express-Server"
    description = "Ares app server deployed through terraform"
  }
  security_groups = [aws_security_group.ares_sg.name]
  user_data = file("userdata.sh")
}

resource "aws_security_group" "ares_sg" {

  name = "ares-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}