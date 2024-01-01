output "app_name" {
  value = azurerm_linux_web_app.web-app.name
}


output "app_url" {
  value = azurerm_linux_web_app.web-app.default_hostname
  #value =  azurerm_linux_web_app.web-app.app_url.default_hostname

}
