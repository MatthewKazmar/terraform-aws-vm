output "aws_instance" {
  description = "The AWS instance resource."
  value = aws_instance.this
}

output "aws_eip" {
  description = "The AWS EIP resource."
  value = aws_eip.this
}