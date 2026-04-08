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
