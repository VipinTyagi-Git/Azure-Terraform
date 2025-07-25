# Output the full internal map of Network Interfaces
output "all_nic_details" {
  description = "Detailed attributes of all created Network Interfaces."
  value       = azurerm_network_interface.vm-nic
}