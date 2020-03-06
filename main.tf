#
# Resource Group and Network definition for the environment
#

terraform {
  required_version = ">= 0.12"
}

# Azure Provider
provider "azurerm" {
  version         = "=1.38.0"
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
}

# Resource Group
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.prefix}resource-group"
  location = var.region

  tags = {
    environment = var.etag
  }
}

# Virtual Network
resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.prefix}virtual-network"
  address_space       = [var.virtual_network_address_space]
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  tags = {
    environment = var.etag
  }
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}subnet"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefix       = var.subnet_address_prefix
}
