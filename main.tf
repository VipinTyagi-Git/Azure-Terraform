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

module "Compute" {
  for_each = var.vm-names
  source = "./Modules/Compute"
  rg-name = var.rg-name
  location = var.location
  vm-name = each.value.name
  vm_nic-name = each.value.nic_name
  vm_subnet-name = each.value.subnet_id
  publisher = each.value.publisher
  sku = each.value.sku
  offer = each.value.offer
  os-version = each.value.os-version
  vm-size = each.value.vm-size
  
  
}


  