# variable "development_aws_account_id" {}
# variable "development_aws_role_arn" {}
# variable "production_aws_account_id" {}
# variable "production_aws_role_arn" {}


#  variable "clusterversion" {}
#  variable "instance_type" {}
#  variable "instance_type_list" {}
 variable "region" {}
 variable "vm_size" {}
 variable "agent_count" {
  default = 2
 }
 variable "sku_tier" {
}
 variable "agent_count_min" {
  default = 1
 }
 variable "agent_count_max" {
  default = 6
 }
variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "log_analytics_workspace_sku" {
  default = "PerGB2018"
}


#List only AWS accounts that the script will apply  - environment.auto.tfvars
# variable "allowed_account_ids" {
#   description = "List of allowed AWS account ids where resources can be created"
#   default     = []
# }

variable "aks_service_principal_app_id" {
  description = "Application ID/Client ID  of the service principal. Used by AKS to manage AKS related resources on Azure like vms, subnets."
}

variable "aks_service_principal_client_secret" {
  description = "Secret of the service principal. Used by AKS to manage Azure."
}

variable "aks_service_principal_object_id" {
  description = "Object ID of the service principal."
}

variable "aks_enable_rbac" {
  description = "Enable RBAC on the AKS cluster. Defaults to false."
  default     = false
}


variable "keyvaultsecrets" {
    type = map(string)
    default = {
       
    }
}

variable "terraformSP" {
    description = "Object ID of the service principal for Terraform SP."
}

variable "keyvaultAdminSP_group_ObjectID" {
    description = "Object ID of the service principal for Keyvaults admins"
}

# variable "clearly_ssl_certificate" {
#   default = "~/.ssh/clearly-dev.pfx"
# }
/*
variable "clearly_dev_certification_password" {
  default = "#{clearly_dev_certification_password}#"
}

variable "clearly_stage_certification_password" {
  default = "#{clearly_stage_certification_password}#"
}

variable "clearly_main_certification_password" {
  default = "#{clearly_main_certification_password}#"
}

variable "keyvault_main_certificate" {
  default = "clearlymaincert"
}
variable "keyvault_stage_certificate" {
  default = "clearlystagecert"
}
variable "keyvault_dev_certificate" {
  default = "clearlydevcert"
}
*/