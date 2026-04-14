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

output "data_factory_name" {
  description = "Data Factory name"
  value       = module.data_factory.data_factory_name
}

output "data_factory_principal_id" {
  description = "ADF Managed Identity principal ID"
  value       = module.data_factory.data_factory_principal_id
}

output "snowflake_warehouse" {
  description = "Snowflake warehouse name"
  value       = module.snowflake.warehouse_name
}

output "snowflake_raw_database" {
  description = "Snowflake raw database name"
  value       = module.snowflake.raw_database_name
}

output "snowflake_analytics_database" {
  description = "Snowflake analytics database name"
  value       = module.snowflake.analytics_database_name
}

output "snowflake_reporting_database" {
  description = "Snowflake reporting database name"
  value       = module.snowflake.reporting_database_name
}

output "log_analytics_workspace_name" {
  description = "Log Analytics workspace name"
  value       = module.monitoring.log_analytics_workspace_name
}
