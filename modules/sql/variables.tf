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

variable "subnet_id" {
  description = "Subnet ID allowed to access SQL"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault ID to retrieve SQL admin password"
  type        = string
}

variable "sql_admin_username" {
  description = "SQL Server admin username"
  type        = string
}

variable "sql_admin_password" {
  description = "SQL Server admin password"
  type        = string
  sensitive   = true
}

variable "allowed_ip_address" {
  description = "Your local IP allowed through SQL firewall"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}
