module "dns_delegated" {
  source  = "cloudposse/stack-config/yaml//modules/remote-state"
  version = "2.0.1"

  component   = "dns-delegated"
  environment = module.iam_roles.global_environment_name

  context = module.this.context
}

module "acm" {
  source  = "cloudposse/stack-config/yaml//modules/remote-state"
  version = "2.0.1"

  component     = "acm"
  ignore_errors = true

  defaults = {
    domain_name = ""
  }

  context = module.this.context
}

module "vpc" {
  source  = "cloudposse/stack-config/yaml//modules/remote-state"
  version = "2.0.1"

  component = "vpc"

  context = module.this.context
}
