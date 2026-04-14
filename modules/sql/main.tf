resource "azurerm_mssql_server" "main" {
  name                         = "sql-${var.project}-${var.environment}"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  minimum_tls_version          = "1.2"
  tags                         = var.tags
}

resource "azurerm_mssql_database" "staging" {
  name         = "sqldb-staging-${var.environment}"
  server_id    = azurerm_mssql_server.main.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  sku_name     = "S0"
  max_size_gb  = 10
  tags         = var.tags
}

resource "azurerm_mssql_firewall_rule" "allow_local" {
  name             = "allow-local-dev"
  server_id        = azurerm_mssql_server.main.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

resource "azurerm_mssql_virtual_network_rule" "main" {
  name      = "vnet-rule-${var.environment}"
  server_id = azurerm_mssql_server.main.id
  subnet_id = var.subnet_id
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "sql-admin-password"
  value        = var.sql_admin_password
  key_vault_id = var.key_vault_id
  tags         = var.tags
}
