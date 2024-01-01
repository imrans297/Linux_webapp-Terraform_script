resource "azurerm_linux_web_app" "web-app" {
  name                =  var.linux_web-app-name
  location            =  var.location
  resource_group_name =  var.rg-name
  service_plan_id     =  var.service_plan_id  #azurerm_service_plan.app-plan.id #" 

  provisioner "local-exec" {
    command = "az webapp deployment source config-zip --resource-group ${var.rg-name} --name ${azurerm_linux_web_app.web-app.name} --src /home/imranshaikh/Downloads/Tasks/Task-B/python-app/python-example.zip" # Deploy ZIP to Azure Web App"
  
  }

  storage_account {
      name                = "WebsiteStorageConnectionString"
      type                = "AzureFiles"
      account_name        = var.storage_account_name         
      access_key          =  var.access_key                   
      share_name          =  var.share-file-name              
      mount_path          = "/mounts/guides"
    }

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE                     = "1"
    SCM_DO_BUILD_DURING_DEPLOYMENT               = "true"
    APPINSIGHTS_INSTRUMENTATIONKEY               = var.app_insights_instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING        = var.app-insights_connectionstring
    ApplicationInsightsAgent_EXTENSION_VERSION   = "~3"
    STORAGE_ACCOUNT_NAME                         = var.storage_account_name    
    storage_account_access_key                   = var.access_key   
  }

  site_config {
    application_stack {
      python_version = var.python_version          #"3.9"
    }
  }
  #zip_deploy_file = "/home/imranshaikh/Downloads/Tasks/Task-A/python-app/python-example.zip"
}

# resource "azurerm_app_service_source_control" "sourcecontrol" {
  
#   app_id             = azurerm_linux_web_app.web-app.id
#   repo_url           = "https://github.com/imrans297/Sample_PythonApp.git"#https://github.com/lisawong19/python-docs-hello-world.git
#   branch             = "master"
#   use_manual_integration = true
#   #depends_on = [ azurerm_linux_web_app.web-app ]
# }

