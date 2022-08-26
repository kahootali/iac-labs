resource "aws_s3_bucket" "bucket" {
  count  = var.create_s3 ? 1 : 0
  bucket = var.s3_name
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = var.s3_name
    environment = var.env
  }
}

