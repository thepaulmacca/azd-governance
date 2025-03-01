# Service Principal
# ------------------
# See https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals

resource "azuread_application" "app" {
  display_name = local.name
  owners       = var.owners_list
}

resource "azuread_service_principal_password" "workspace_sp_secret" {
  service_principal_id = azuread_service_principal.sp.id
}

resource "azuread_service_principal" "sp" {
  client_id = azuread_application.app.client_id
  owners    = var.owners_list
}
