terraform {
  backend "azurerm" {
    resource_group_name   = "tfstorage-rg"
    storage_account_name  = "tfstorageacct"
    container_name        = "tfstorecont"
    key                   = "envname.tfstate"
  }
}

