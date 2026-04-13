variable "resource_group_name" {
  description = "Resource Group Name"
  default     = "rg-dso-qdb"
}

variable "location" {
  description = "Azure region"
  default     = "East US"
}

variable "cluster_name" {
  description = "AKS Cluster Name"
  default     = "Qqddemocluster"
}

variable "node_count" {
  description = "Number of AKS nodes"
  default     = 2
}

variable "acr_name" {
  description = "ACR name (must be globally unique)"
  default     = "qdbhexawaredemo"
}
variable "tenant_id" {}
