variable "vpc_cidr" {
  description = "This is VPC CIDR ange"
  type        = string
}

variable "public_subnets" {
  description = "Ths is subnets cidr"
  type        = list(string)
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}