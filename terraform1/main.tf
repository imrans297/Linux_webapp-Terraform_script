resource "random_id" "storage_account" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    resource_group_name = var.rg-name
  }

  byte_length = 8
}



module "app_service_plan" {
    source                    = "./app_service_plan"
    service_plan_name         = var.service_plan_name #"${var.name}-azserviceplan"  #"app-service2"
    rg-name                   = var.rg-name
    location                  = var.location
    os_type                   = var.os_type
}

module "app_insights" {
    source                      = "./insights"
    app_insights_name           = var.app_insights_name
    rg-name                     = var.rg-name
    location                    = var.location    
}

module "Az_storage" {
    source                      = "./storage"
    storage_account_name        = var.storage_account_name
    rg-name                     = var.rg-name
    location                    = var.location
    storage_share_name         = "demo-${random_id.storage_account.hex}"
    
  
}
 
 #depend_on  = [module.web_app.name]

module "web_app" {
    source                        = "./Linux_web-app"
    linux_web-app-name            = var.linux_web-app-name
    rg-name                       = var.rg-name
    location                      = var.location
    python_version                = var.python_version
    app-location                  = var.app-location
    service_plan_id               = module.app_service_plan.plan-id
    storage_account_name          = var.storage_account_name   #  var.storage_account_name#"${var.name}" #module.storage_account_name #module.storage_account.my-storage.name
    access_key                    = module.Az_storage.primary_access_key
    app-insights_connectionstring = module.app_insights.app-insights_connectionstring    #app-insights_connectionstring.connection_string#module.azurerm_application_insights.my-app-insights.connection_string
    share-file-name               = "demo-${random_id.storage_account.hex}" #var.storage_share_name#"${var.name}-installersfileshare"

    
    
    

    
}