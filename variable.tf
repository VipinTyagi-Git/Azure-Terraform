variable "rg-name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet-name" {
  type = string
}

variable "nsg-name" {
  type = string
}

variable "subnets" {
  type = map(object({
    name           = string
    address_prefix = string
  }))
}

variable "vm-names" {
  type = map(object({
    name       = string
    nic_name   = string
    publisher  = string
    offer      = string
    sku        = string
    os-version = string
    vm-size    = string
    subnet_id= string
  }))

}



