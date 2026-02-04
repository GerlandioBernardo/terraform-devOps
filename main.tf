data "aws_ami" "ubuntu" {

  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"]

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_security_group" "ifpb_security_group" {
  name = "web_security_group"
  description = "Permite apenas HTTP"

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_instance" "maquina_ec2" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t3.micro"

    vpc_security_group_ids = [ aws_security_group.ifpb_security_group.id ]

    user_data = file("user_data.sh")

    tags = {
      Name = "maquina-ec2-ubuntu-ifpb-gerlandiobernardo"
    }
}

resource "aws_s3_bucket" "bucket" {

  bucket = var.nome_bucket

  tags = {
    Name = "bucket-ifpb-gerlandiobernardo"
    Environment = "Dev"
  }
}