#
# Required Azure Authentication
#

variable "azure_client_id" {
  type        = string
  description = "Azure Client ID"
  default     = ""
}

variable "azure_client_secret" {
  type        = string
  description = "Azure Client Secret"
  default     = ""
}

variable "azure_tenant_id" {
  type        = string
  description = "Azure Tenant ID"
  default     = ""
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  default     = ""
}


#
# Required Variables
#

variable "virtual_network_address_space" {
  type        = string
  description = "Address Space for the Virtual Network"
}

variable "subnet_address_prefix" {
  type        = string
  description = "Address Prefix for the Subnet"
  default     = ""
}




#
# Optional Variables
#

variable "region" {
  description = "The azure region for deployment"
  type        = string
  default     = "eastus"
}

variable "prefix" {
  description = "The prefix for all resources"
  type        = string
  default     = ""
}

variable "etag" {
  description = "The environment tag"
  type        = string
  default     = ""
}

