data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.this.id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id

  tags = merge({
    Name = var.instance_name
    },
    var.tags
  )

  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}

resource "aws_eip" "this" {
  instance = aws_instance.this.id
  vpc      = true

  tags = merge({
    Name = var.instance_name
    },
    var.tags
  )
}