resource "azurerm_data_factory" "main" {
  name                = "adf-${var.project}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  identity {
    type = "SystemAssigned"
  }
}

# Grant ADF Managed Identity access to Key Vault
resource "azurerm_role_assignment" "adf_kv_reader" {
  scope                = var.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_data_factory.main.identity[0].principal_id
}

# Grant ADF Managed Identity access to Storage
resource "azurerm_role_assignment" "adf_storage_contributor" {
  scope                = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_name}"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_data_factory.main.identity[0].principal_id
}

data "azurerm_client_config" "current" {}

# Key Vault Linked Service
resource "azurerm_data_factory_linked_service_key_vault" "main" {
  name            = "ls_keyvault"
  data_factory_id = azurerm_data_factory.main.id
  key_vault_id    = var.key_vault_id
}

# ADLS Gen2 Linked Service using Managed Identity
resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "main" {
  name                 = "ls_adls_gen2"
  data_factory_id      = azurerm_data_factory.main.id
  url                  = "https://${var.storage_account_name}.dfs.core.windows.net"
  use_managed_identity = true
}

# Azure SQL Linked Service
resource "azurerm_data_factory_linked_service_azure_sql_database" "main" {
  name            = "ls_azure_sql"
  data_factory_id = azurerm_data_factory.main.id
  connection_string = "integrated security=False;encrypt=True;connection timeout=30;data source=${var.sql_server_fqdn};initial catalog=${var.sql_database_name};user id=${var.sql_admin_username};Password=@Microsoft.KeyVault(VaultName=${split(".", split("//", var.key_vault_uri)[1])[0]};SecretName=sql-admin-password)"
}
