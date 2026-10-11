data "aws_cloudformation_type" "cloudformation_type_lookup" {
  for_each = var.cloudformation_type_lookup

  arn        = each.value.arn
  region     = each.value.region
  type       = each.value.type
  type_name  = each.value.type_name
  version_id = each.value.version_id
}

