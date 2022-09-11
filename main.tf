# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "TFResourceGroup"
  location = "West Europe"
}


locals {
  azurerm_resource_group = "TFResourceGroup"
  location               = "West Europe"

}

resource "azurerm_virtual_network" "Vnet" {
  name                = "AppGWVnet"
  location            = local.location
  resource_group_name = local.azurerm_resource_group
  address_space       = ["10.0.0.0/16"]

  subnet {

    name           = "AppGWSubnet"
    address_prefix = "10.0.0.0/24"
  }

}
