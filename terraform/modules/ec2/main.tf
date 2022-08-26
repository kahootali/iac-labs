module "ec2-instance" {
  source    = "../ec2-module"
  ec2_name  = "my-instance"
  ec2_count = 2

  instance_type       = "t2.micro"
  monitoring          = true
  security_group_name = "allow-ssh"
  subnet_name         = "demo-subnet-public1-eu-west-1a"
  env                 = "prod"
}
