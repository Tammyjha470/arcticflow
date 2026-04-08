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

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}

variable "admin_object_id" {
  description = "Object ID of the admin user or service principal"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "Subnet ID allowed to access Key Vault"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}
variable "allowed_ip_address" {
  description = "Your local IP address allowed through Key Vault firewall"
  type        = string
}
