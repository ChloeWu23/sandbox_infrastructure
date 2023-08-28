
# All Configs variables assigned  here

# allowed_account_ids = [""] # Add you AWS Account ID in comma separated list. You can add multiple account Ids here


# #Dev Environment settings (default workspace)
# development_aws_account_id = "" # Add you AWS Account ID
# development_aws_role_arn   = ""

# # #Prod Environment setting (production workspace)  #when you craete Prod Environment uncomment this
# production_aws_account_id = ""
# production_aws_role_arn   = ""


region = "northeurope"
#vm_size = "#{vm_size}#"
vm_size = "Standard_D2_v2"
#sku_tier = "#{sku_tier}#"
sku_tier = "Free"

agent_count = 1
agent_count_max = 3
agent_count_min = 1

#ssh_public_key = "#{ssh_public_key}#"


#log_analytics_workspace_sku = "2ad21c7d-02ab-4aba-b1ab-afce1e5807a5"
log_analytics_workspace_sku = "PerGB2018"

aks_service_principal_object_id = "#{aks_service_principal_object_id}#"
# aks_service_principal_object_id = "2ad21c7d-02ab-4aba-b1ab-afce1e5807a5"

aks_service_principal_client_secret        = "#{aks_service_principal_client_secret}#"
# aks_service_principal_client_secret = "dCw8Q~PvbCAjUrUp_R6huGaAUOGCykW3a2bQ2dvZ"

aks_service_principal_app_id =  "#{aks_service_principal_app_id}#"
# aks_service_principal_app_id =  "61659873-b2bf-49fd-879a-59ab4633a67b"

aks_enable_rbac = "#{aks_enable_rbac}#"
# aks_enable_rbac = true

#not sure about this one
# terraformSP = "2ad21c7d-02ab-4aba-b1ab-afce1e5807a5"
terraformSP = "#{terraformSP}#"


# keyvaultAdminSP_group_ObjectID = "#{keyvaultAdminSP_group_ObjectID}#"
#this value put devOp group object ID
keyvaultAdminSP_group_ObjectID = "83a394cd-7b99-4780-abb6-ad6ee02c6957"


# keyvaultsecrets = {
#   
#    #"example" = "value"

# }

