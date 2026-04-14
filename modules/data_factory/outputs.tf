output "data_factory_id" {
  description = "ID of the Data Factory"
  value       = azurerm_data_factory.main.id
}

output "data_factory_name" {
  description = "Name of the Data Factory"
  value       = azurerm_data_factory.main.name
}

output "data_factory_principal_id" {
  description = "Managed Identity principal ID of ADF"
  value       = azurerm_data_factory.main.identity[0].principal_id
}
