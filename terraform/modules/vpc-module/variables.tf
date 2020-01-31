variable "main_address_space" {
}

variable "cidr_block_all" {
  default = "0.0.0.0/0"
}

variable "parent_tags" {
  default     = {}
  description = "Used to pass tags from the invoking module that are extended. Must contain a Name tag."
}

variable "common_name" {
}

variable "aws_region" {
}