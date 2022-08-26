variable "ec2_name" {
  type = string
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
