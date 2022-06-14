module "session-manager" {
  source          = "git::ssh://git@github.com/osodevops/aws-terraform-module-ssm-parameter-store.git"
  write_parameter = var.parameter_write
  #read_parameter  =  var.parameter_read
}