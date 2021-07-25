module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.vpc-name}"
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.public_subnets
  public_subnets  = var.private_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
/*
resource "aws_internet_gateway" "internet_gateway" {
 vpc_id = module.vpc.vpc_id
}

resource "aws_eip" "gateway_eip" {}

resource "aws_nat_gateway" "nat_gateway" {
 allocation_id = "${aws_eip.gateway_eip.id}"
 subnet_id     = module.vpc.public_subnets[0]
 depends_on    = ["aws_internet_gateway.internet_gateway"]
}

resource "aws_route_table" "nat_route_table" {
 vpc_id = module.vpc.vpc_id
}

resource "aws_route" "nat_route" {
 route_table_id         = "${aws_route_table.nat_route_table.id}"
 destination_cidr_block = "0.0.0.0/0"
 nat_gateway_id         = "${aws_nat_gateway.nat_gateway.id}"
}
resource "aws_route_table_association" "private_route" {
 #count          = "${length(var.aws_zones)}"
 count          = 1
 subnet_id      = "${element(aws_subnet.private_subnet.*.id, count.index)}"
 route_table_id = "${aws_route_table.nat_route_table.id}"
}*/