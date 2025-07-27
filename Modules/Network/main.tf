resource "azurerm_virtual_network" "vn-canberra" {
  name                = var.vnet-name
  location            = var.location
  resource_group_name = var.rg-name
  address_space       = ["10.0.64.0/18"]

}

resource "azurerm_network_security_group" "nsg-canberra" {
  name                = var.nsg-name
  location            = var.location
  resource_group_name = var.rg-name

  
}


resource "azurerm_subnet" "subnet" {
    for_each = var.subnets
  name                 = each.value.name
  resource_group_name  = var.rg-name
  virtual_network_name = var.vnet-name
  address_prefixes     = [each.value.address_prefix]
  depends_on           = [azurerm_virtual_network.vn-canberra]
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet" {
    for_each = var.subnets
  subnet_id                 = each.value.id
  network_security_group_id = azurerm_network_security_group.nsg-canberra.id

  
}
