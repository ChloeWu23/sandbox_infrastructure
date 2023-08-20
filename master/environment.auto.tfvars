
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
ssh_public_key = "~/.ssh/id_rsa.pub"

#log_analytics_workspace_sku = "2ad21c7d-02ab-4aba-b1ab-afce1e5807a5"
log_analytics_workspace_sku = "PerGB2018"

#aks_service_principal_object_id = "#{aks_service_principal_object_id}#"
aks_service_principal_object_id = "810791c4-b184-48dd-9b0d-52ac8784f071"

#aks_service_principal_client_secret        = "#{aks_service_principal_client_secret}#"
aks_service_principal_client_secret        = "6ab7d0f7-7fca-475a-9d32-9faaf16bf95f"

#aks_service_principal_app_id =  "#{aks_service_principal_app_id}#"
aks_service_principal_app_id =  "bdb8dba1-244a-4220-bcf4-a5fd26d6f28f"

#aks_enable_rbac = "#{aks_enable_rbac}#"
aks_enable_rbac = true

#not sure about this one
terraformSP = "810791c4-b184-48dd-9b0d-52ac8784f071"

#keyvaultAdminSP_group_ObjectID = "#{keyvaultAdminSP_group_ObjectID}#"
#this value put devOp group object ID
keyvaultAdminSP_group_ObjectID = "83a394cd-7b99-4780-abb6-ad6ee02c6957"


keyvaultsecrets = {
   "VITEMAPBOXACCESSTOKEN" = "#{VITEMAPBOXACCESSTOKEN}#"
   "VITEAPIURL" = "#{VITEAPIURL}#"
   "FRONTENDPORT" = "#{FRONTENDPORT}#"
   "VITENODEENV" = "#{VITENODEENV}#"
   "VITElogBucketName" = "#{VITElogBucketName}#"
   "VITESUPERSETURL" = "#{VITESUPERSETURL}#"

   #"VITESUPERSETSANDBOXDASHBOARDID" = "#{VITESUPERSETSANDBOXDASHBOARDID}#"
   "VITESUPERSETSANDBOXDASHBOARDID" = 3

   #"VITESUPERSETSANDBOXDASHBOARDREALTIMEID" = "#{VITESUPERSETSANDBOXDASHBOARDREALTIMEID}#"
   "VITESUPERSETSANDBOXDASHBOARDREALTIMEID" = 0

   #"VITESUPERSETSANDBOXINDEXID" = "#{VITESUPERSETSANDBOXINDEXID}#"
   "VITESUPERSETSANDBOXINDEXID" = 4

   #"VITESUPERSETLEZROUTEID" = "#{VITESUPERSETLEZROUTEID}#"
   "VITESUPERSETLEZROUTEID" = 5

   #"VITESUPERSETOVERVIEWPEPSICOID" = "#{VITESUPERSETOVERVIEWPEPSICOID}#"
    "VITESUPERSETOVERVIEWPEPSICOID" = 11

   #"VITEGAMEASUREMENTID" = "#{VITEGAMEASUREMENTID}#"
   "VITEGAMEASUREMENTID" = "#{VITEGAMEASUREMENTID}#"
   "VITEKEYCLOAKURL" = "#{VITEKEYCLOAKURL}#"
   "VITEKEYCLOAKREALM" = "#{VITEKEYCLOAKREALM}#"
   "VITEKEYCLOAKCLIENTID" = "#{VITEKEYCLOAKCLIENTID}#"
   "VITEKEYCLOAKBACKENDCLIENTUUID" = "#{VITEKEYCLOAKBACKENDCLIENTUUID}#"
   "VITEKEYCLOAKREDIRECTURI" = "#{VITEKEYCLOAKREDIRECTURI}#"
   "VITEKEYCLOAKBACKENDCLIENTSECRET" = "#{VITEKEYCLOAKBACKENDCLIENTSECRET}#"

   #"VITESUPERSETOVERVIEWPEPSICOIDv050" = "#{VITESUPERSETOVERVIEWPEPSICOIDv050}#"
   "VITESUPERSETOVERVIEWPEPSICOIDv050" = 11

   #"VITESUPERSETOVERVIEWPEPSICOSITEDETAILID" = "#{VITESUPERSETOVERVIEWPEPSICOSITEDETAILID}#"
   "VITESUPERSETOVERVIEWPEPSICOSITEDETAILID" = 2
   
   #"VITESUPERSETOVERVIEWPEPSICONORTHAMERICAFLEETOVERVIEWID" = "#{VITESUPERSETOVERVIEWPEPSICONORTHAMERICAFLEETOVERVIEWID}#"
   "VITESUPERSETOVERVIEWPEPSICONORTHAMERICAFLEETOVERVIEWID" = 1
   
   #"VITESUPERSETOVERVIEWACMENORTHAMERICAFLEETOVERVIEWID" = "#{VITESUPERSETOVERVIEWACMENORTHAMERICAFLEETOVERVIEWID}#"
   "VITESUPERSETOVERVIEWACMENORTHAMERICAFLEETOVERVIEWID" = 23
   #"VITESUPERSETDATAQUALITYREVIEWID" = "#{VITESUPERSETDATAQUALITYREVIEWID}#"
   "VITESUPERSETDATAQUALITYREVIEWID" = 17

   
   #"VITESUPERSETRAZCOMPLIANCEIDACME" = "#{VITESUPERSETRAZCOMPLIANCEIDACME}#"
   "VITESUPERSETRAZCOMPLIANCEIDACME" = 24

   #"VITESUPERSETDATAQUALITYREVIEWIDACME" = "#{VITESUPERSETDATAQUALITYREVIEWIDACME}#"
   "VITESUPERSETDATAQUALITYREVIEWIDACME" = 25

   # Backend
   "SERVERTOKENSECRET" = "#{SERVERTOKENSECRET}#"
   "NODEENV" = "#{NODEENV}#"
   "BACKENDPORT" = "#{BACKENDPORT}#"
   "LOGLEVEL" = "#{LOGLEVEL}#"
   "dburl" = "#{dburl}#"
   "bucketName" = "#{bucketName}#"
   "accessKey" = "#{accessKey}#"
   "secretKey" = "#{secretKey}#"
   "logBucketName" = "#{logBucketName}#"
   "logAccessKey" = "#{logAccessKey}#"
   "logSecretKey" = "#{logSecretKey}#"
   "adminAccessKey" = "#{adminAccessKey}#"
   "adminSecretKey" = "#{adminSecretKey}#"
   "GAMEASUREMENTID" = "#{GAMEASUREMENTID}#"
   "keycloakHost" = "#{keycloakHost}#"
   "keycloakRealmName" = "#{keycloakRealmName}#"
   "keycloakClientId" = "#{keycloakClientId}#"
   "keycloakClientSecret" = "#{keycloakClientSecret}#"
   "DATABRICKSTOKEN" = "#{DATABRICKSTOKEN}#"
   "DATABRICKSSERVERHOSTNAME" = "#{DATABRICKSSERVERHOSTNAME}#"
   "DATABRICKSHTTPPATH" = "#{DATABRICKSHTTPPATH}#"
   "ENVIRONMENT" = "#{ENVIRONMENT}#"

   "VITEMIXPANELTOKEN" = "#{VITEMIXPANELTOKEN}#"
   
   #"VITESUPERSETSITEDETAILSACMEID" = "#{VITESUPERSETSITEDETAILSACMEID}#"
   "VITESUPERSETSITEDETAILSACMEID" = 22

   #"VITESUPERSETRAZCOMPLIANCEID" = "#{VITESUPERSETRAZCOMPLIANCEID}#"
   "VITESUPERSETRAZCOMPLIANCEID" = 21

}

