output "resource_group_name" {
  description = "Name of the main resource group"
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Location of the main resource group"
  value       = azurerm_resource_group.main.location
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.main.name
}

output "subnet_data_id" {
  description = "ID of the data subnet"
  value       = azurerm_subnet.data.id
}

output "subnet_private_id" {
  description = "ID of the private endpoint subnet"
  value       = azurerm_subnet.private.id
}

output "subnet_compute_id" {
  description = "ID of the compute subnet"
  value       = azurerm_subnet.compute.id
}
