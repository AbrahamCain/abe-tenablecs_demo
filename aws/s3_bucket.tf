resource "aws_s3_bucket" "tenable_cs_demo_s3_bucket" {
  bucket = "tenablecsdemos3bucket"
  acl    = "private"
  tags   = var.default_tags

  versioning {
    enabled = true
  }

  versioning {
    enabled    = true
    mfa_delete = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = "<master_kms_key_id>"
      }
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}