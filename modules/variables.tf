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