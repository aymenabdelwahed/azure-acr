terraform {
  required_version = ">= 0.12.0"
  required_providers {
    azurerm = "~> 1.36.0"
  }
}

provider "azurerm" {
  version         = "=1.36.0"
  subscription_id = var.subscription
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  tags                = var.tags
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false
  #georeplication_locations = ["East US", "North Europe"]
  georeplication_locations = var.georeplication
}

resource "azurerm_role_assignment" "acr_role_assignment" {
  count                = length(var.roles)
  scope                = azurerm_container_registry.acr.id
  role_definition_name = var.roles[count.index].role
  principal_id         = var.service_principal_groups
}
