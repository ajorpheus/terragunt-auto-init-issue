remote_state {
  backend      = "s3"
  disable_init = false
  config = {
    bucket         = "my-terraform-state-dev2"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "my-terraform-locks-dev2"
    encrypt        = true
  }
}

inputs = {
  aws_region                = "${get_env("TF_VAR_aws_region", "eu-west-2")}"
  aws_secretsmanager_region = "${get_env("TF_VAR_aws_secretsmanager_region", "eu-west-2")}"
  common_name               = "my-tg-deployment2"
}
