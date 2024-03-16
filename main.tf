resource "aws_instance" "ec2instance" {
  ami                         = "ami-028eb925545f314d6"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0d8a5b1b33899449e"
  associate_public_ip_address = true
  availability_zone           = "us-west-2b"
  tags = {
    "Name" = "Terraform_demo"
  }
  vpc_security_group_ids = ["sg-089afdc80cd4db6fb"]

}

resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Security group for web servers"

  # Inbound rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Add more inbound rules as needed

  # Outbound rules (allow all egress traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


