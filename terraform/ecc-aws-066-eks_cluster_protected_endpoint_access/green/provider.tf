terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
}

provider "aws"{
  profile = var.profile
  region = var.default-region

  default_tags {
    tags = {
      CustodianRule    = "ecc-aws-066-eks_cluster_protected_endpoint_access"
      ComplianceStatus = "Green"
    }
  }
}