# output "app_name" {
#     #value = azurerm_linux_web_app
#   value = azurerm_linux_web_app.web-app.name
# }

output "app_url" {
    value = module.web_app.app_url
}

# output "storage_account_name" {
#   value = module.azurerm_storage_account.my-storage.name
# }

# output "app-insights_connectionstring" {
#     value = app-insights_connectionstring.connection_string
  
# }

