variable "key_pair_name" {
  description = "Name of AWS Key Pair name in the region"
  type        = string
}

variable "instance_name" {
  description = "Name of the instance."
  type        = string
}

variable "instance_type" {
  description = "Size of instance."
  type        = string
  default     = "t3a.small"
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to the instance."
  type        = map(string)
  default     = {}
}