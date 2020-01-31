# tf apply 

terraform {
  source = "${path_relative_from_include()}/../../terraform//${path_relative_to_include()}"
}

include {
  path = find_in_parent_folders()
}