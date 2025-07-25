rg-name   = "rg-canberra"
vnet-name = "vn-canberra"
location  = "Australia Central"
nsg-name  = "nsg-canberra"

subnets = {
  "sn-01-canberra" = {
    name           = "sn-01-canberra"
    address_prefix = "10.0.64.0/24"
  }
  "sn-02-canberra" = {
    name           = "sn-02-canberra"
    address_prefix = "10.0.65.0/25"
  }
}

vm-names = {
  "vm-01-canberra" = {
    name       = "vm-01-canberra"
    nic_name   = "vm-01-canberra-nic"
    publisher  = "MicrosoftWindowsServer"
    offer      = "WindowsServer"
    sku        = "2019-Datacenter"
    os-version = "latest"
    vm-size    = "Standard_D2a_v4"
  }
  "vm-02-canberra" = {
    name       = "vm-02-canberra"
    nic_name   = "vm-02-canberra-nic"
    publisher  = "MicrosoftWindowsServer"
    offer      = "WindowsServer"
    sku        = "2016-Datacenter"
    os-version = "latest"
    vm-size    = "Standard_D2a_v4"
  }
}


