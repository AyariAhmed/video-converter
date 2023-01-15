terraform {
  required_version = "~>1.3.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.31.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "devops-automation-project"
    container_name       = "cluster"
    storage_account_name = "terraformstateconverter"
    key                  = "cluster.json"
  }
}
