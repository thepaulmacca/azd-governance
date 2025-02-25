variable "resource_group_name" {
  type        = string
  description = "Name of resource group of this workspace the service principal is scoped to."
}

variable "project_id" {
  type        = string
  description = "Azure DevOps Project Id"
}
