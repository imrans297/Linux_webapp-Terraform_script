resource "azurerm_service_plan" "app-plan" {
  name                  =  var.service_plan_name                      # demo-servicePlan"
  location              = var.location
  resource_group_name   = var.rg-name
  os_type               = var.os_type
  sku_name              = "S1"
}
