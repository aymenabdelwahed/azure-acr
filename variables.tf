variable "subscription" {
}

variable "acr_name" {
  description = "The Azure Container Registry (ACR) name"
}

variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
}

variable "location" {
  description = "The ACR location where all resources should be created"
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default = {
    environment = "Production"
  }
}

variable "roles" {
  description = "List of roles that should be assigned to Azure AD Object_ids."
  type        = list(object({ role = string }))
  default     = []
}

variable "sku" {
  description = "The Azure Container Registry SKU. Possible values {Basic, Standard, Premium}"
  default     = "Premium"
}

variable "georeplication" {
  description = "A list of Azure locations where the container registry should be geo-replicated. (The list must be different from the )"
  type        = list
  default     = ["West US", "North Europe"]
}

variable "service_principal_groups" {
  description = "The Azure AD group where Azure ACR Admins resides in"
}
