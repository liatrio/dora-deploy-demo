terraform {
  source = "git@github.com:liatrio/dora-lambda-tf-module-demo?ref=main"
}

locals {
  env_vars = yamldecode(file("vars.yaml"))
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  region = "${include.root.locals.common.aws_region}"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket  = "${local.env_vars.env}-dora-tfstate"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region  = "${include.root.locals.common.aws_region}"
    encrypt = true
  }
}

