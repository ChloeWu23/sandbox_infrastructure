# # Create Azure Key Vault
# resource "azurerm_key_vault" "sandbox_keyvault" {
#   name                        = "${local.productprefix}-kv-${local.environment}"
#   location                    = azurerm_resource_group.sandbox-cadt-rg.location
#   resource_group_name         = azurerm_resource_group.sandbox-cadt-rg.name
#   enabled_for_disk_encryption = false
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false

#   sku_name = "standard"
#   tags                = {
#     Environment = local.environment
#     Product = local.productprefix
#   }
# }
# # Define Access Policies
# # Access Policy For Cluster
# resource "azurerm_key_vault_access_policy" "sandbox_keyvault_policy" {
#     key_vault_id            = "${azurerm_key_vault.sandbox_keyvault.id}"
#     object_id               = "${data.azurerm_client_config.current.object_id}"
#     secret_permissions      = [
#         "Get",
#         "List",
#         "Set",
#         "Delete",
#         "Get",
#         "List",
#         "Set",
#         "Delete",
#         "Recover",
#         "Backup",
#         "Purge",
#         "Restore",
#     ]
#     # /* comment out certificate permissions
    
#     certificate_permissions = [
#       "Create",
#       "Delete",
#       "DeleteIssuers",
#       "Get",
#       "GetIssuers",
#       "Import",
#       "List",
#       "ListIssuers",
#       "ManageContacts",
#       "ManageIssuers",
#       "SetIssuers",
#       "Update",
#     ]

#     # */

#     tenant_id               = "${data.azurerm_client_config.current.tenant_id}"
    
# }


# # Access Policy For Terraform Service Principal
# resource "azurerm_key_vault_access_policy" "sandbox_keyvault_policyTerraform" {
#     key_vault_id            = "${azurerm_key_vault.sandbox_keyvault.id}"
#     object_id               = "${var.terraformSP}"
#     secret_permissions      = [
#         "Get",
#         "List",
#         "Set",
#         "Delete",
#         "Get",
#         "List",
#         "Set",
#         "Delete",
#         "Recover",
#         "Backup",
#         "Purge",
#         "Restore",
#     ]
#     certificate_permissions = [
#       "Create",
#       "Delete",
#       "DeleteIssuers",
#       "Get",
#       "GetIssuers",
#       "Import",
#       "List",
#       "ListIssuers",
#       "ManageContacts",
#       "ManageIssuers",
#       "SetIssuers",
#       "Update",
#       "Purge",
#     ]
#     tenant_id               = "${data.azurerm_client_config.current.tenant_id}"
# depends_on = [
#     azurerm_key_vault.sandbox_keyvault
# ]
# }
# # Access Policy For AKS User Identity for Keyvault Secrets
# resource "azurerm_key_vault_access_policy" "sandbox_keyvault_policy_managedidentity" {
#     key_vault_id            = "${azurerm_key_vault.sandbox_keyvault.id}"
#     object_id               = "${azurerm_user_assigned_identity.userIdentity.principal_id}"
#     secret_permissions      = [
#         "Get",
#         "List",
#         "Set",
#         "Delete",
#         "Get",
#         "List",
#         "Set",
#         "Delete",
#         "Recover",
#         "Backup",
#         "Purge",
#         "Restore",
#     ]
    
#     certificate_permissions = [
#       "Create",
#       "Delete",
#       "DeleteIssuers",
#       "Get",
#       "GetIssuers",
#       "Import",
#       "List",
#       "ListIssuers",
#       "ManageContacts",
#       "ManageIssuers",
#       "SetIssuers",
#       "Update",
#       "Purge",
#     ]

#     tenant_id               = "${data.azurerm_client_config.current.tenant_id}"
# depends_on = [
#     azurerm_key_vault.sandbox_keyvault
# ]
# }

# # Access Policy For Sandbox Users
# resource "azurerm_key_vault_access_policy" "sandbox_keyvault_policy_keyvaultadmingrp" {
#     key_vault_id            = "${azurerm_key_vault.sandbox_keyvault.id}"
#     object_id               = "${var.keyvaultAdminSP_group_ObjectID}"
#     secret_permissions      = [
#         "Get",
#         "List",
#         "Set",
#         "Delete",
#         "Get",
#         "List",
#         "Set",
#         "Delete",
#         "Recover",
#         "Backup",
#         "Purge",
#         "Restore",
#     ]
  
#     certificate_permissions = [
#       "Create",
#       "Delete",
#       "DeleteIssuers",
#       "Get",
#       "GetIssuers",
#       "Import",
#       "List",
#       "ListIssuers",
#       "ManageContacts",
#       "ManageIssuers",
#       "SetIssuers",
#       "Purge",
#       "Update",
#     ]

#     tenant_id               = "${data.azurerm_client_config.current.tenant_id}"
# depends_on = [
#     azurerm_key_vault.sandbox_keyvault
# ]
# }

# # attach the secrets to the keyvault 
# resource "azurerm_key_vault_secret" "secret" {
#   count = length(var.keyvaultsecrets)
#   name         = keys(var.keyvaultsecrets)[count.index]
#   value        = values(var.keyvaultsecrets)[count.index]
#   key_vault_id = azurerm_key_vault.sandbox_keyvault.id
#   tags                = {
#     Environment = local.environment
#     Product = local.productprefix
#   }
#   depends_on = [
#     azurerm_key_vault.sandbox_keyvault,
#     azurerm_key_vault_access_policy.sandbox_keyvault_policyTerraform
#     # azurerm_key_vault_access_policy.sandbox_keyvault_policy_managedidentity
#   ]
# }
# # attach the certificate to the Keyvault for application gateway
# resource "azurerm_key_vault_certificate" "sandbox_certificate_dev" {
#   count        = local.isDev
#   name         = var.keyvault_dev_certificate
#   key_vault_id = azurerm_key_vault.sandbox_keyvault.id

#   certificate {
#     contents = filebase64("cadt.pfx")
#     password = var.sandbox_dev_certification_password

#   }
#   tags                = {
#     Environment = local.environment
#     Product = local.productprefix
#   }
#   depends_on = [
#     azurerm_key_vault.sandbox_keyvault,
#     azurerm_key_vault_access_policy.sandbox_keyvault_policyTerraform
#     # azurerm_key_vault_access_policy.sandbox_keyvault_policy_managedidentity
#   ]
# }
# /*
# # attach the certificate to the Keyvault for application gateway
# resource "azurerm_key_vault_certificate" "sandbox_certificate_main" {
#   count        = local.isMain
#   name         = var.keyvault_main_certificate
#   key_vault_id = azurerm_key_vault.sandbox_keyvault.id

#   certificate {
#     # Load the certificate contents from a file and convert to base64
#     contents = filebase64("sandbox-main.pfx")
#     # Set the password for the certificate
#     password = var.sandbox_main_certification_password

#   }
#   # Set tags to help identify the resource later
#   tags                = {
#     Environment = local.environment
#     Product = local.productprefix
#   }
#   # Ensure that the certificate resource depends on the Key Vault resource and the access policy resource
#   depends_on = [
#     azurerm_key_vault.sandbox_keyvault,
#     azurerm_key_vault_access_policy.sandbox_keyvault_policyTerraform
#     # azurerm_key_vault_access_policy.sandbox_keyvault_policy_managedidentity
#   ]
# }
# */
