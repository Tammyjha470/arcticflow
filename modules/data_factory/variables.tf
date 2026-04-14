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

variable "key_vault_id" {
  description = "Key Vault ID for linked service"
  type        = string
}

variable "key_vault_uri" {
  description = "Key Vault URI for linked service"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the ADLS Gen2 storage account"
  type        = string
}

variable "sql_server_fqdn" {
  description = "Fully qualified domain name of the SQL Server"
  type        = string
}

variable "sql_database_name" {
  description = "Name of the staging database"
  type        = string
}

variable "sql_admin_username" {
  description = "SQL Server admin username"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}
