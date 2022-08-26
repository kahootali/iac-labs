resource "aws_s3_bucket" "my_bucket" {
  bucket = "kahoot-s3-bucket-without-vars"

  tags = {
    Name        = "kahoot-s3-bucket-without-vars"
    Environment = "Test"
  }
}