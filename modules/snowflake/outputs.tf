output "warehouse_name" {
  description = "Name of the Snowflake warehouse"
  value       = snowflake_warehouse.main.name
}

output "raw_database_name" {
  description = "Name of the raw database"
  value       = snowflake_database.raw.name
}

output "analytics_database_name" {
  description = "Name of the analytics database"
  value       = snowflake_database.analytics.name
}

output "reporting_database_name" {
  description = "Name of the reporting database"
  value       = snowflake_database.reporting.name
}

output "loader_role_name" {
  description = "Name of the loader role"
  value       = snowflake_account_role.loader.name
}

output "transformer_role_name" {
  description = "Name of the transformer role"
  value       = snowflake_account_role.transformer.name
}

output "analyst_role_name" {
  description = "Name of the analyst role"
  value       = snowflake_account_role.analyst.name
}
