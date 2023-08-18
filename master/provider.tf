terraform {
  required_version = ">=1.0"
  backend "azurerm" {
    resource_group_name                = "sandbox-cadt-terraform-backup"
    storage_account_name               = "sandboxcadtterraform"
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
