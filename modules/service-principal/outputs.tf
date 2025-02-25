output "aad_app" {
  value = {
    display_name = azuread_application.app.display_name
    object_id    = azuread_application.app.object_id
    client_id    = azuread_application.app.client_id
  }
}

output "display_name" {
  value = azuread_application.app.display_name
}

output "principal_id" {
  value = azuread_service_principal.sp.object_id
}

output "client_id" {
  value       = azuread_application.app.client_id
  description = "Client ID for Service Principal"
}

output "client_secret" {
  value       = azuread_service_principal_password.workspace_sp_secret.value
  description = "Client Secret for Service Principal to be imported into Key Vault"
  sensitive   = true
}
