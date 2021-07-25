provider "aws" {
  shared_credentials_file = var.shared_credentials_file
  profile                 = var.aws_profile
  region                  = var.region
}