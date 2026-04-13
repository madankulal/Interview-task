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

module "keyvault" {
  source              = "./modules/keyvault"
  kv_name             = "aks-devops-kv"
  location            = var.location
  resource_group_name = module.rg.rg_name
  tenant_id           = var.tenant_id
  app_message         = "Thanks for the opportunity and this app is running on AKS Cluster"

  aks_object_id       = module.aks.kubelet_identity_object_id
}

