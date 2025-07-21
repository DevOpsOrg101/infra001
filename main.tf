terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "4556d065-e801-43d2-bae9-68a06a4a8886"
}

resource "azurerm_resource_group" "rg3" {
  name     = "rg-demo123"
  location = "West Europe"
}


