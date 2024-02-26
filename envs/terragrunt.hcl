locals {
  common      = yamldecode(file("common-inputs.yaml"))
  module_name = basename(get_terragrunt_dir())
}

inputs = merge(
  local.common
)

//generate "providers" {
//  path      = "providers.tf"
//  if_exists = "overwrite"
//  contents  = <<EOF
//terraform {
//  required_version = ">=1.0"
//}
//EOF
//}
