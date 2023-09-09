provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "manik_rg" {
  name     = "manik-adf-rg"
  location = "eastus"
}

# Azure Key Vault
resource "azurerm_key_vault" "manik_kv" {
  name                = "manikadfkeyvault"
  location            = azurerm_resource_group.manik_rg.location
  resource_group_name = azurerm_resource_group.manik_rg.name
  tenant_id           = var.tenant_id

  sku_name = "standard"
}

# Azure Storage Account (For Blob Containers)
resource "azurerm_storage_account" "manik_sa" {
  name                     = "manikadfsa"
  resource_group_name      = azurerm_resource_group.manik_rg.name
  location                 = azurerm_resource_group.manik_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Azure Data Factory
resource "azurerm_data_factory" "manik_adf" {
  name                = "manik-adf"
  location            = azurerm_resource_group.manik_rg.location
  resource_group_name = azurerm_resource_group.manik_rg.name
  identity {
    type = "SystemAssigned"
  }
}
