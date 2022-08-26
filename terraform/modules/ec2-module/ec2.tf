data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.security_group_name]
  }
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"
  name    = "${var.ec2_name}-${count.index}"

  count                       = var.ec2_count
  ami                         = "ami-ebd02392"
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ec2_key_pair.key_name
  monitoring                  = var.monitoring
  vpc_security_group_ids      = [data.aws_security_group.selected.id]
  subnet_id                   = data.aws_subnet.selected.id
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = var.env
  }
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "ec2_key_pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdNh/ZxHIoFlxpWQNC2iB1ElXxeP3DXKbrXkMJkqAt9JaDiGGpsXTJM4V79Ff2YrkY7Zrt261mmCgv+e6NCQs7l6C/dWAPndqQzFnz8wCNBaum3kWf9SR87ihFxBLQlEf0IaQcHYm9oijKL52IjgJ6jRek1xB/tpqcVU8ooyvazJisc8Ht8NX8zkOn9A1ujaTvpCI2s1kAgjzFuTkE0hn30XQD0TKGpmkWrZ4FPLuq7KA+xblrW8174pcFTiiHnU2kd/q+psGnJJmmeSDE3871+pEoY7/FL66+xQ4Yi0SCfdsYGt7k9cO7gyCw0oXo0tDQ/leWgAqFNB1YM6MLXCClFkBu3NGzbvMd3HbPHH1RXXk1NhdJUomOzwLBEQ/VW1CpdaVqgJnWvL3d8j/l09OUl6oX9crn/MEjdzrBME8bJYTeIIpjQSpSNKPLiKSNAXLON/uWJSAyHJwBd7SP63Ix5nX0K286WjJ9UVWQK5XJP+oHrvOOyhEM9j9EgAcES18= kahoot.ali@gmail.com"
}
