resource "azurerm_log_analytics_workspace" "log" {
  name                = "aks-log-workspace"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
}
