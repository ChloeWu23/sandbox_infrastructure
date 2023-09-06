locals {
  env           = terraform.workspace
  productprefix = "sandbox-cadt"

  #BEGIN: Workspace Environments (index is based on workspace selected)
  environments = {
    "default"    = "local" # maps default workspace to local environment
    "develop"    = "dev"   # maps develop workspace to dev environment
    "main" = "main"        # maps main workspace to main environment
  }

  envs = {
    "default"    = "local"
    "develop"    = "dev"
    "main" = "main"
  }
  vnet_address_range = {
     "default" = ["172.10.0.0/16"]
     "develop" = ["172.20.0.0/16"]
     "main"    = ["172.30.0.0/16"] 
  }
  k8s_subnet_range = {
     "default" = ["172.30.0.0/22"]
     "develop" = ["172.20.0.0/22"]
     "main"    = ["172.30.1.0/22"] 
  }
  appgw_subnet_range = {
     "default" = ["172.10.16.0/20"]
     "develop" = ["172.20.16.0/20"]
     "main"    = ["172.30.16.0/20"] 
  }
 
  #END: Workspace Environments

  #Local Variables 
  environment = lookup(local.environments, local.env)
  envprefix   = lookup(local.envs, local.env)
  envsuffix   = lookup(local.envs, local.env)
  vnetaddressrange   = lookup(local.vnet_address_range , local.env)
  k8ssubnet   = lookup(local.k8s_subnet_range , local.env)
  appgwsubnet   = lookup(local.appgw_subnet_range , local.env)

  stdprefix   = "${local.productprefix}-${local.envprefix}"



  #Boolean Variables
  isMain = local.env == "main" ? 1 : 0
  isDev  = local.env == "develop" ? 1 : 0

}
