module "rg" {
  source   = "./modules/resource-group"
  rg_name  = var.resource_group_name
  location = var.location
}

module "monitoring" {
  source   = "./modules/monitoring"
  rg_name  = module.rg.rg_name
  location = var.location
}

module "acr" {
  source   = "./modules/acr"
  acr_name = var.acr_name
  rg_name  = module.rg.rg_name
  location = var.location
}

module "aks" {
  source             = "./modules/aks"
  cluster_name       = var.cluster_name
  location           = var.location
  rg_name            = module.rg.rg_name
  node_count         = var.node_count
  log_analytics_id   = module.monitoring.workspace_id
  acr_id             = module.acr.acr_id
}
resource "azurerm_key_vault_access_policy" "aks_policy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = var.tenant_id
  object_id    = var.aks_object_id

  secret_permissions = [
    "Get",
    "List"
  ]
}

