output "virtual_network_id" {
  description = "The ID of the created Virtual Network."
  value       = azurerm_virtual_network.vn-canberra.id
}

output "subnet_ids" {
  description = "A map of subnet names to their IDs created by the module."
  value       = { for k, v in azurerm_subnet.subnet : k => v.id }
}

