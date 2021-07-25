variable "region" {
  description = "AWS Region eg., us-west-2"
}

variable "shared_credentials_file" {
  description = "Enter absolute path for your aws credentials eg., ~/.aws/credentials"
}

variable "aws_profile" {
  description = "AWS profile name in credentials file"
}

variable "key-name" {
  description = "Create and enter Key pair in AWS console under Network & Security"
}

variable "vpc-name" {
  description = "VPC Name"
}

variable "azs" {
  description = "Availability Zones"
  default     = ["us-west-2a"]
}

variable "cidr" {
  default     = "10.0.0.0/16"
}

# http://checkip.amazonaws.com/
variable "my_ip_cidr_block" {
  description = "Check IP address on http://checkip.amazonaws.com/ and enter cidr block like xx.xxx.xxx.xx/x"
}

variable "public_subnets" {
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "ami_id" {
  default     = ["ami-0dc8f589abe99f538"]
}

variable "instance_type" {
  default     = ["t2.micro"]
}
