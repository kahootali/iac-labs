variable "s3_name" {
  description = "S3 Name"
  type        = string
}

variable "create_s3" {
  description = "Whether to create S3 bucket"
  type        = bool
}

variable "region" {
  type = string
}

variable "env" {
  type = string
}