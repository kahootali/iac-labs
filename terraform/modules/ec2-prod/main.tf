module "ec2-instance" {
  source        = "../ec2-module"
  ec2_name      = "prod-instance"
  key_pair_name = "prod-key-pair"
  ec2_count     = 1

  instance_type       = "t2.micro"
  monitoring          = true
  security_group_name = "allow-ssh"
  subnet_name         = "demo-subnet-public1-eu-west-1a"
  env                 = "prod"
}
