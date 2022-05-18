terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "tf-state-uns-030556409702"
    key     = "iac/state"
    region  = "us-east-1"
    encrypt = "true"
  }
}