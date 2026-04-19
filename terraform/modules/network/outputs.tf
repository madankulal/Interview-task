output "aks_subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}

output "hub_vnet_id" {
  value = azurerm_virtual_network.hub_vnet.id
}

output "spoke_vnet_id" {
  value = azurerm_virtual_network.spoke_vnet.id
}
