
# All Configs variables assigned  here

# allowed_account_ids = [""] # Add you AWS Account ID in comma separated list. You can add multiple account Ids here


# #Dev Environment settings (default workspace)
# development_aws_account_id = "" # Add you AWS Account ID
# development_aws_role_arn   = ""

# # #Prod Environment setting (production workspace)  #when you craete Prod Environment uncomment this
# production_aws_account_id = ""
# production_aws_role_arn   = ""


region = "northeurope"
vm_size = "#{vm_size}#"
sku_tier = "#{sku_tier}#"
agent_count = 1
agent_count_max = 3
agent_count_min = 1
ssh_public_key = "#{ssh_public_key}#"
log_analytics_workspace_sku = "#{log_analytics_workspace_sku}#"
aks_service_principal_object_id = "#{aks_service_principal_object_id}#"
aks_service_principal_client_secret        = "#{aks_service_principal_client_secret}#"
aks_service_principal_app_id =  "#{aks_service_principal_app_id}#"
aks_enable_rbac = "#{aks_enable_rbac}#"
terraformSP = "#{terraformSP}#"
keyvaultAdminSP_group_ObjectID = "#{keyvaultAdminSP_group_ObjectID}#"
keyvaultsecrets = {
   "VITEMAPBOXACCESSTOKEN" = "#{VITEMAPBOXACCESSTOKEN}#"
   "VITEAPIURL" = "#{VITEAPIURL}#"
   "FRONTENDPORT" = "#{FRONTENDPORT}#"
   "VITENODEENV" = "#{VITENODEENV}#"
   "VITElogBucketName" = "#{VITElogBucketName}#"
   "VITESUPERSETURL" = "#{VITESUPERSETURL}#"
   "VITESUPERSETCLEARLYDASHBOARDID" = "#{VITESUPERSETCLEARLYDASHBOARDID}#"
   "VITESUPERSETCLEARLYDASHBOARDREALTIMEID" = "#{VITESUPERSETCLEARLYDASHBOARDREALTIMEID}#"
   "VITESUPERSETCLEARLYINDEXID" = "#{VITESUPERSETCLEARLYINDEXID}#"
   "VITESUPERSETLEZROUTEID" = "#{VITESUPERSETLEZROUTEID}#"
   "VITESUPERSETOVERVIEWPEPSICOID" = "#{VITESUPERSETOVERVIEWPEPSICOID}#"
   "VITEGAMEASUREMENTID" = "#{VITEGAMEASUREMENTID}#"
   "VITEKEYCLOAKURL" = "#{VITEKEYCLOAKURL}#"
   "VITEKEYCLOAKREALM" = "#{VITEKEYCLOAKREALM}#"
   "VITEKEYCLOAKCLIENTID" = "#{VITEKEYCLOAKCLIENTID}#"
   "VITEKEYCLOAKBACKENDCLIENTUUID" = "#{VITEKEYCLOAKBACKENDCLIENTUUID}#"
   "VITEKEYCLOAKREDIRECTURI" = "#{VITEKEYCLOAKREDIRECTURI}#"
   "VITEKEYCLOAKBACKENDCLIENTSECRET" = "#{VITEKEYCLOAKBACKENDCLIENTSECRET}#"
   "VITESUPERSETOVERVIEWPEPSICOIDv050" = "#{VITESUPERSETOVERVIEWPEPSICOIDv050}#"
   "VITESUPERSETOVERVIEWPEPSICOSITEDETAILID" = "#{VITESUPERSETOVERVIEWPEPSICOSITEDETAILID}#"
   "VITESUPERSETOVERVIEWPEPSICONORTHAMERICAFLEETOVERVIEWID" = "#{VITESUPERSETOVERVIEWPEPSICONORTHAMERICAFLEETOVERVIEWID}#"
   "VITESUPERSETDATAQUALITYREVIEWID" = "#{VITESUPERSETDATAQUALITYREVIEWID}#"
   "VITESUPERSETOVERVIEWACMENORTHAMERICAFLEETOVERVIEWID" = "#{VITESUPERSETOVERVIEWACMENORTHAMERICAFLEETOVERVIEWID}#"
   "VITESUPERSETRAZCOMPLIANCEIDACME" = "#{VITESUPERSETRAZCOMPLIANCEIDACME}#"
   "VITESUPERSETDATAQUALITYREVIEWIDACME" = "#{VITESUPERSETDATAQUALITYREVIEWIDACME}#"
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
   "VITESUPERSETSITEDETAILSACMEID" = "#{VITESUPERSETSITEDETAILSACMEID}#"
   "VITESUPERSETRAZCOMPLIANCEID" = "#{VITESUPERSETRAZCOMPLIANCEID}#"
}

