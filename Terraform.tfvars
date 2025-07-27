rg-name   = "rg-wales"
vnet-name = "vn-wales"
location  = "Australia east"
nsg-name  = "nsg-wales"

subnets = {
  "sn-01-wales" = {
    name           = "sn-01-wales"
    address_prefix = "10.0.64.0/24"
  }
  "sn-02-wales" = {
    name           = "sn-02-wales"
    address_prefix = "10.0.65.0/25"
  }
}

vm-names = {
  "vm-01-wales" = {
    name           = "vm-01-wales"
    nic_name       = "vm-01-wales-nic"
    publisher      = "MicrosoftWindowsServer"
    offer          = "WindowsServer"
    sku            = "2019-Datacenter"
    os-version     = "latest"
    vm-size        = "Standard_D2a_v4"
    vm_subnet-id   = "sn-01-wales"
  }
  "vm-02-wales" = {
    name           = "vm-02-wales"
    nic_name       = "vm-02-wales-nic"
    publisher      = "MicrosoftWindowsServer"
    offer          = "WindowsServer"
    sku            = "2016-Datacenter"
    os-version     = "latest"
    vm-size        = "Standard_D2a_v4"
    vm_subnet-id   = "sn-01-wales"
  }
}


