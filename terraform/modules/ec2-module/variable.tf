variable "ec2_name" {
  type = string
}
variable "key_pair_name" {
  type = string
  default = "ec2_key_pair"
}
variable "instance_type" {
  type = string
}

variable "monitoring" {
  type = bool
}
variable "env" {
  type = string
}
variable "subnet_name" {
  type = string
}
variable "security_group_name" {
  type = string
}
variable "ec2_count" {
  type = number
}
