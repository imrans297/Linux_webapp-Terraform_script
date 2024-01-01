output "instrumentation_key" {
  value = azurerm_application_insights.my-app-insights.instrumentation_key
  sensitive = true
}
output "app-insights_connectionstring" {
     #value = azurerm_application_insights.my-app-insights
    value = azurerm_application_insights.my-app-insights.connection_string
}