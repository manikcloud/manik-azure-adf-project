output "key_vault_id" {
  value = azurerm_key_vault.manik_kv.id
}

output "data_factory_name" {
  value = azurerm_data_factory.manik_adf.name
}
