resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "aksdemo"

  default_node_pool {
  name           = "nodepool"
  node_count     = var.node_count
  vm_size        = "Standard_DC2s_v3"
  type           = "VirtualMachineScaleSets"
  vnet_subnet_id = var.aks_subnet_id
}
network_profile {
  network_plugin = "azure"
  network_policy = "azure"
}

  identity {
    type = "SystemAssigned"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_id
  }

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  lifecycle {
    ignore_changes = [
      key_vault_secrets_provider
    ]
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}
