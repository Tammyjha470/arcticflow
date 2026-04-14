resource "azurerm_log_analytics_workspace" "main" {
  name                = "law-${var.project}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}

# Key Vault diagnostics
resource "azurerm_monitor_diagnostic_setting" "key_vault" {
  name                       = "diag-kv-${var.environment}"
  target_resource_id         = var.key_vault_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  enabled_log {
    category = "AuditEvent"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

# Data Factory diagnostics
resource "azurerm_monitor_diagnostic_setting" "data_factory" {
  name                       = "diag-adf-${var.environment}"
  target_resource_id         = var.data_factory_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  enabled_log {
    category = "ActivityRuns"
  }

  enabled_log {
    category = "PipelineRuns"
  }

  enabled_log {
    category = "TriggerRuns"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

# SQL Server diagnostics
resource "azurerm_monitor_diagnostic_setting" "sql" {
  name                       = "diag-sql-${var.environment}"
  target_resource_id         = "${var.sql_server_id}/databases/sqldb-staging-${var.environment}"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  enabled_log {
    category = "SQLInsights"
  }

  enabled_log {
    category = "Errors"
  }

  metric {
    category = "Basic"
    enabled  = true
  }
}

# Action group for alerts
resource "azurerm_monitor_action_group" "main" {
  name                = "ag-${var.project}-${var.environment}"
  resource_group_name = var.resource_group_name
  short_name          = "arcticflow"
  tags                = var.tags

  email_receiver {
    name          = "admin-email"
    email_address = var.alert_email
  }
}

# ADF pipeline failure alert
resource "azurerm_monitor_metric_alert" "adf_pipeline_failed" {
  name                = "alert-adf-pipeline-failed-${var.environment}"
  resource_group_name = var.resource_group_name
  scopes              = [var.data_factory_id]
  description         = "Alert when ADF pipeline runs fail"
  severity            = 2
  frequency           = "PT5M"
  window_size         = "PT15M"
  tags                = var.tags

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "PipelineFailedRuns"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

# Storage account capacity alert
resource "azurerm_monitor_metric_alert" "storage_capacity" {
  name                = "alert-storage-capacity-${var.environment}"
  resource_group_name = var.resource_group_name
  scopes              = [var.storage_account_id]
  description         = "Alert when storage exceeds 80 percent capacity"
  severity            = 2
  frequency           = "PT1H"
  window_size         = "PT6H"
  tags                = var.tags

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "UsedCapacity"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 858993459200
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}
