locals {
  ip_configuration_name = "ip_config"
  ip_allocation         = "Dynamic"
  admin_username        = "adminuser"
  admin_password        = "P@$$w0rd1234!"
  caching               = "ReadWrite"
  storage_account_type  = "Standard_LRS"
}

resource "azurerm_network_interface" "vm-nic" {
  name                = var.vm_nic-name
  location            = var.location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = local.ip_configuration_name
    #subnet_id                     = module.Network.subnet_ids[var.value.vm_subnet-name]
    private_ip_address_allocation = local.ip_allocation
  }

}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.value.vm-name
  location              = var.location
  resource_group_name   = var.rg-name
  network_interface_ids = [azurerm_network_interface.vm-nic.id]
  vm_size               = var.value.vm-size 

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.value.publisher
    offer     = var.value.offer
    sku       = var.value.sku
    version   = var.value.os-version
  }
  storage_os_disk {
    name              = "${var.value.vm-name}-osdisk"
    caching           = local.caching
    create_option     = "FromImage"
    managed_disk_type = local.storage_account_type
  }
  os_profile {
    computer_name  = var.value.vm-name
    admin_username = local.admin_username
    admin_password = local.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true

  }
}