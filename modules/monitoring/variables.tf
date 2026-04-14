variable "project" {
  description = "Project name prefix"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "storage_account_id" {
  description = "ID of the storage account to monitor"
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Key Vault to monitor"
  type        = string
}

variable "data_factory_id" {
  description = "ID of the Data Factory to monitor"
  type        = string
}

variable "sql_server_id" {
  description = "ID of the SQL Server to monitor"
  type        = string
}

variable "alert_email" {
  description = "Email address for monitoring alerts"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}
