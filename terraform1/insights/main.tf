resource "azurerm_application_insights" "my-app-insights" {
  name                   = "demo-appinsights"
  location               = var.location
  resource_group_name    = var.rg-name
  application_type       = "web"
}


