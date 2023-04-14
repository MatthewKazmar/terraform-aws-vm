output "aws_instance" {
  description = "The AWS instance resource."
  value       = aws_instance.this
}

output "aws_eip" {
  description = "The AWS EIP resource."
  value       = aws_eip.this
}

output "name_ip" {
  description = "Hash of name/IP"
  value       = { (aws_instance.this.tags["Name"]) = [aws_eip.this.public_ip, aws_instance.this.private_ip] }
}