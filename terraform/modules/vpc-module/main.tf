resource "aws_vpc" "this" {
  cidr_block           = var.main_address_space
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.module_common_tags
}

resource "aws_default_security_group" "main_vpc_default_sg" {
  vpc_id = aws_vpc.this.id
  tags = merge(
    local.module_common_tags,
    {
      "Name" = "${local.common_name_prefix}_Default-SG"
    },
  )
}

resource "aws_default_route_table" "this" {
  default_route_table_id = aws_vpc.this.default_route_table_id
  tags = merge(
    local.module_common_tags,
    {
      "Name" = "${local.common_name_prefix}_Default_RTB"
    },
  )
}

data "aws_availability_zones" "available" {
  state             = "available"
  blacklisted_names = [for pair in setproduct([var.aws_region], ["c"]) : join("", pair)]
}


