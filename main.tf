provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "static_site" {
  bucket = "my-static-site-bucket-123456789"  # Change this to your bucket name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.static_site.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.static_site.id}/*"
    }
  ]
}
POLICY
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "index.html"
  source       = "index.html"  # Ensure this file exists
  content_type = "text/html"
  acl          = "public-read"
}

output "website_url" {
  value = aws_s3_bucket.static_site.website_endpoint
}
