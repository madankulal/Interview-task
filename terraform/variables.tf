variable "resource_group_name" {
  description = "Resource Group Name"
  default     = "aks-devops-rg"
}

variable "location" {
  description = "Azure region"
  default     = "East US"
}

variable "cluster_name" {
  description = "AKS Cluster Name"
  default     = "aks-devops-cluster"
}

variable "node_count" {
  description = "Number of AKS nodes"
  default     = 2
}

variable "acr_name" {
  description = "ACR name (must be globally unique)"
  default     = "aksdevopsacr12345"
}
