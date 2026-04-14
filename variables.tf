variable "project" {
  description = "Project name prefix for all resources"
  type        = string
  default     = "arcticflow"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "australiaeast"
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default = {
    project     = "arcticflow"
    environment = "dev"
    managed_by  = "terraform"
  }
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
  sensitive   = true
}

variable "admin_object_id" {
  description = "Object ID of the admin user"
  type        = string
  sensitive   = true
}

variable "snowflake_account" {
  description = "Snowflake account identifier"
  type        = string
  sensitive   = true
}

variable "snowflake_user" {
  description = "Snowflake username"
  type        = string
  sensitive   = true
}

variable "snowflake_private_key_path" {
  description = "Path to Snowflake RSA private key"
  type        = string
  sensitive   = true
}

variable "snowflake_private_key_passphrase" {
  description = "Passphrase for Snowflake RSA private key"
  type        = string
  sensitive   = true
}
variable "allowed_ip_address" {
  description = "Your local IP address allowed through Key Vault firewall"
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
