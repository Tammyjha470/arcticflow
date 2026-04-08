output "storage_account_id" {
  description = "ID of the storage account"
  value       = azurerm_storage_account.main.id
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.main.name
}

output "storage_account_primary_endpoint" {
  description = "Primary DFS endpoint for ADLS Gen2"
  value       = azurerm_storage_account.main.primary_dfs_endpoint
}

output "bronze_filesystem_id" {
  description = "ID of the bronze container"
  value       = azurerm_storage_data_lake_gen2_filesystem.bronze.id
}

output "silver_filesystem_id" {
  description = "ID of the silver container"
  value       = azurerm_storage_data_lake_gen2_filesystem.silver.id
}

output "gold_filesystem_id" {
  description = "ID of the gold container"
  value       = azurerm_storage_data_lake_gen2_filesystem.gold.id
}
