module "s3_bucket" {
  #for_each = toset([local.epor-esmd-bucket, local.esmd-epor-bucket , local.esmd-payload-process, local.esmd-qurantine])
  for_each = toset(["${var.env_type}-epor-esmd-bucket", "${var.env_type}-esmd-epor-bucket", "${var.env_type}-esmd-payload-process", "${var.env_type}-esmd-qurantine"])
  source = "./modules/s3"
  bucket = "${each.key}"
  force_destroy = true
  acl    = "private"

  versioning = {
    status     = true

  }

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = "AES256"
      }
    }
  }
  
  tags = merge(
    {
      Name = "tf-${each.key}"
    },
    local.common_tags,
    )
}

resource "aws_s3_bucket_policy" "epor_esmd_policy" {
  bucket = "${var.env_type}-epor-esmd-bucket"
  policy = file (var.epor_esmd_policy)
  #policy = file ("files/s3_bucket_policy/iac-epor-esmd-bucket_policy.json")
}

resource "aws_s3_bucket_policy" "esmd_epor_policy" {
  bucket = "${var.env_type}-esmd-epor-bucket"
  policy = file (var.esmd_epor_policy)
}

resource "aws_s3_bucket_policy" "esmd_payload_policy" {
  bucket = "${var.env_type}-esmd-payload-process"
  policy = file (var.esmd_payload_policy)
}

resource "aws_s3_bucket_policy" "esmd_qurantine_policy" {
  bucket = "${var.env_type}-esmd-qurantine"
  policy = file (var.esmd_qurantine_policy)
}