provider "aws" {
  region  = "eu-west-2"
  version = "~> 2.33.0"
}

terraform {
  backend "s3" {}
}

module "common_tags" {
  source    = "git::https://github.com/cloudposse/terraform-null-label?ref=tags/0.14.1"
  namespace = "es"
  stage     = "dev"
  name      = local.common_name_prefix
  delimiter = "-"

  tags = {
    Team      = "SomeTeam"
    ManagedBy = "Terraform"
    AppName   = local.common_name_prefix
  }
}

module "vpc" {
  source = "../modules/vpc-module"
  main_address_space   = var.main_address_space
  cidr_block_all       = var.cidr_block_all
  common_name          = var.common_name

  parent_tags = merge(
    module.common_tags.tags,
    {
      "Name" = local.common_name_prefix
    },
  )
  aws_region    = var.aws_region
}

locals {
  common_tags        = module.common_tags.tags
  common_name_prefix = var.common_name
}

