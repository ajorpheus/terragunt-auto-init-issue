locals {
  common_name_prefix = var.common_name
  module_common_tags = merge(
    var.parent_tags,
    {
      "CreatedIn" = "vpc-module"
    },
  )
  private_vpc_resource_tags = merge(
    local.module_common_tags,
    {
      "Visibility" = "Private"
      "CreatedIn"  = "vpc-module/vpc_private_subnets"
    },
  )
  public_vpc_resource_tags = merge(
    local.module_common_tags,
    {
      "Visibility" = "Public"
      "CreatedIn"  = "vpc-module/vpc_public_subnets"
    },
  )
}

