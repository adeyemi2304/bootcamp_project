backend "s3" {
    bucket = "bootcamp30-31-adeyemi"
    key = "terraform/terraform.tfstate"
    dynamodb_table = "terraform-lock"
    region = "us-west-1"
 }

resource "aws_s3_bucket" "mybucket"{
  bucket = "bootcamp30-31-adeyemi"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name = "My terraform-bucket"
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name = "terraform-lock"
  hash_key = "LockID"
  read_capacity = 3
  write_capacity = 3
  attribute {
     name = "LockID"
     type = "S"
   }
  tags = {
    Name = "Terraform Lock Table"
   }
   lifecycle {
   prevent_destroy = false
  }
 }

 resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}