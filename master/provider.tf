#here related to backend resource_group configuration
terraform {
  required_version = ">=1.0"
  backend "azurerm" {
    resource_group_name                = "sandbox-cadt-dev-northeurope-rg-master"
    storage_account_name               = "sandboxcadtterraform1"
    container_name                     = "sandboxterraformstate"
    key                                = "terraform.state"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
