variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "private_subnets" {
  description = "VPC Private Subnet"
  type        = list(string)
}

variable "public_subnets" {
  description = "VPC Public Subnet"
  type        = list(string)
}
