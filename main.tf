terraform {
  backend "azurerm" {
    resource_group_name  = "rg-manosij"
    storage_account_name = "manosijstg1"
    container_name       = "manosij-container1"
    key                  = "manosij.tfstate" # State file name
  }
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

# resource "azurerm_resource_group" "rg" {
#   name     = "rg-manosij1"
#   location = "West Europe"
# }

# resource "azurerm_resource_group" "rg1" {
#   name     = "rg-manosij2"
#   location = "West Europe"
# }

# resource "azurerm_resource_group" "rg3" {
#   name     = "rg-demo123"
#   location = "West Europe"
# }

# resource "azurerm_resource_group" "rg4" {
#   name     = "rg-demo1234"
#   location = "West Europe"
# }

resource "azurerm_resource_group" "rg5" {
  name     = "rg-demo12345"
  location = "West Europe"
}

resource "azurerm_storage_account" "stg" {
  name                     = "storageaccountmanosij"
  resource_group_name      = azurerm_resource_group.rg5.name
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}


resource "azurerm_resource_group" "rg6" {
  name     = "rg-demo123456"
  location = "West Europe"
}

resource "azurerm_storage_account" "stg1" {
  name                     = "storageaccountmanosij1"
  resource_group_name      = "rg-demo123456"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  depends_on               = [azurerm_resource_group.rg6]
}