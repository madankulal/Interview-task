terraform {
  backend "azurerm" {
    resource_group_name  = "rg-dso-qdb-tfstate"
    storage_account_name = "qdbtfstate21092"
    container_name       = "tfstate"
    key                  = "qdb/terraform.tfstate"
  }
}
