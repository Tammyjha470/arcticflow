output "resource_group_name" {
  description = "Main resource group name"
  value       = module.networking.resource_group_name
}

output "vnet_id" {
  description = "Virtual network ID"
  value       = module.networking.vnet_id
}

output "key_vault_name" {
  description = "Key Vault name"
  value       = module.key_vault.key_vault_name
}

output "key_vault_uri" {
  description = "Key Vault URI"
  value       = module.key_vault.key_vault_uri
}
output "storage_account_name" {
  description = "Storage account name"
  value       = module.storage.storage_account_name
}

output "storage_primary_endpoint" {
  description = "ADLS Gen2 primary endpoint"
  value       = module.storage.storage_account_primary_endpoint
}

output "sql_server_name" {
  description = "SQL Server name"
  value       = module.sql.sql_server_name
}

output "sql_server_fqdn" {
  description = "SQL Server fully qualified domain name"
  value       = module.sql.sql_server_fqdn
}

output "sql_database_name" {
  description = "Staging database name"
  value       = module.sql.sql_database_name
}
