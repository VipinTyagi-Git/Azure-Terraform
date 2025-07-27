resource "azurerm_storage_account" "example" {
  name                     = var.storage-account-name
  resource_group_name      = var.rg-name
  location                 = var.location
  account_tier             = var.account-tier
  account_replication_type = var.account-replication-type
  account_kind = var.account-kind

}