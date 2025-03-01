# --------------------
# Azure DevOps Project
# --------------------
# Determine project name based on resource group name:
# - fruits-dev-*-rg    => project-fruits
# - veggies-prod-*-rg  => project-veggies
# - infra-shared-*-rg  => central-it

data "azuredevops_project" "team" {
  project_id = var.project_id
}

# ------------------
# Service Connection
# ------------------
data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}

resource "azuredevops_serviceendpoint_azurerm" "workspace_endpoint" {
  project_id                             = data.azuredevops_project.team.id
  service_endpoint_name                  = "${var.resource_group_name}-connection"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  azurerm_spn_tenantid                   = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id                = data.azurerm_client_config.current.subscription_id
  azurerm_subscription_name              = data.azurerm_subscription.current.display_name
}
