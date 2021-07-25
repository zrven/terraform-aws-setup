module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "nginx"  
  instance_count         = 1
  ami                    = "${var.ami_id[0]}"

  instance_type          = "${var.instance_type[0]}"

  # Need to create key-value pair prior to this one
  key_name               = "${var.key-name}"
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.worker_group_mgmt_one.id, aws_security_group.worker_group_mgmt_three.id]
  subnet_id              = module.vpc.public_subnets[0]

  user_data              = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo amazon-linux-extras install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    sudo chkconfig docker on
    sudo chmod 666 /var/run/docker.sock
    sudo curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
  EOF

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

/*
resource "aws_instance" "ingress" {
  ami           = "ami-0dc8f589abe99f538"
  instance_type = "t2.micro"
  key_name      = "raghav_personal_key"

  security_groups = [aws_security_group.worker_group_mgmt_one.id]
  subnet_id       = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
*/