locals {
  ip_configuration_name = "ip_config"
  ip_allocation         = "Dynamic"
  admin_username        = "adminuser"
  admin_password        = "P@$$w0rd1234!"
  caching               = "ReadWrite"
  storage_account_type  = "Standard_LRS"
}


resource "azurerm_resource_group" "rg-canberra" {
  name     = var.rg-name
  location = var.location
}

module "Network" {
  source    = "./Modules/Network"
  rg-name   = var.rg-name
  vnet-name = var.vnet-name
  nsg-name  = var.nsg-name
  subnets   = var.subnets
  location  = var.location

  depends_on = [azurerm_resource_group.rg-canberra]
}


resource "azurerm_network_interface" "vm-nic" {
  for_each            = var.vm-names
  name                = each.value.nic_name
  location            = var.location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = local.ip_configuration_name
    subnet_id                     = module.Network.subnet_ids["sn-01-canberra"]
    private_ip_address_allocation = local.ip_allocation
  }

}

resource "azurerm_virtual_machine" "vm" {
  for_each              = var.vm-names
  name                  = each.value.name
  location              = var.location
  resource_group_name   = var.rg-name
  network_interface_ids = [azurerm_network_interface.vm-nic[each.value.name].id]
  vm_size               = each.value.vm-size
  

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.os-version
  }
  storage_os_disk {
    name              = "${each.value.name}-osdisk"
    caching           = local.caching
    create_option     = "FromImage"
    managed_disk_type = local.storage_account_type
  }
  os_profile {
    computer_name  = each.value.name
    admin_username = local.admin_username
    admin_password = local.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true

  }
}



  