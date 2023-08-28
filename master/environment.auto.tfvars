
# All Configs variables assigned  here

# allowed_account_ids = [""] # Add you AWS Account ID in comma separated list. You can add multiple account Ids here


# #Dev Environment settings (default workspace)
# development_aws_account_id = "" # Add you AWS Account ID
# development_aws_role_arn   = ""

# # #Prod Environment setting (production workspace)  #when you craete Prod Environment uncomment this
# production_aws_account_id = ""
# production_aws_role_arn   = ""


region = "northeurope"
vm_size = "Standard_D2_v2"
sku_tier = "Free"
agent_count = 1
agent_count_max = 3
agent_count_min = 1

log_analytics_workspace_sku = "PerGB2018"
aks_service_principal_object_id = "#{aks_service_principal_object_id}#"
aks_service_principal_client_secret = "#{aks_service_principal_client_secret}#"
aks_service_principal_app_id =  "#{aks_service_principal_app_id}#"
aks_enable_rbac = "#{aks_enable_rbac}#"
terraformSP = "#{terraformSP}#"
keyvaultAdminSP_group_ObjectID = "#{keyvaultAdminSP_group_ObjectID}#"


# keyvaultsecrets = {
#   
#    #"example" = "value"

# }

