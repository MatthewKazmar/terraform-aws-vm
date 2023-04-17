# terraform-aws-vm

This module deploys a basic VM running Ubuntu 22.04.

For an basic VPC module, see: https://github.com/MatthewKazmar/terraform-aws-vpc

Example:
```
resource "tls_private_key" "this" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "east" {
  provider = aws.east

  key_name   = "east-key"
  public_key = tls_private_key.this.public_key_openssh
}

module "aws_prod_east_vm" {
  providers = {
    aws = aws.east
  }

  source = "github.com/MatthewKazmar/terraform-aws-vm"

  key_pair_name     = aws_key_pair.east.key_name
  name              = "prod-east-vm"
  security_group_id = module.aws_prod_east_vpc.security_group.id
  subnet_id         = module.aws_prod_east_vpc.subnet_workload[0].id
}
```
