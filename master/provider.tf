terraform {
  required_version = ">=1.0"
  backend "azurerm" {
    resource_group_name                = "clearly-earth-terraform-backup"
    storage_account_name               = "clearlyearthterraform"
    container_name                     = "clearlyterraformstate"
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
