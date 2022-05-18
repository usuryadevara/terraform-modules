locals {
  common_tags = {
    EnvType            = var.env_type
    MaintenanceContact = var.maintenance_contact
    ProductLine        = var.product_line
    Provisioner        = var.provisioner
    OwnerContact       = var.owner_contact
  }
}

module "s3_bucket" {
  source = "./modules/s3"

  bucket = "tf-unissant-test-bkt-modulestest"
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
      Name = "tf-unissant-test-bkt-modulestest"
    },
    local.common_tags,
    )
}