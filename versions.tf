terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "portfolio"

  default_tags {
    tags = {
      Project   = "aws-terraform-web-v1"
      ManagedBy = "Terraform"
    }
  }
}
