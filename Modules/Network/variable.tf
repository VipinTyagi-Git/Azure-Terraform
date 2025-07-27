variable "vnet-name" {
  type = string
}

variable "rg-name" {
  type = string
}

variable "location" {
  type = string
}

variable "nsg-name" {
  type = string
}

variable "subnets" {
  type = map(object({
    name = string
    address_prefix= string
  }))
}

