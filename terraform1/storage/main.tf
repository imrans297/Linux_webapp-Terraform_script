


resource "azurerm_storage_account" "my-storage" {
  name                       = var.storage_account_name #"diag${random_id.random_id.hex}"
  resource_group_name        = var.rg-name
  location                   = var.location
  account_tier               = "Standard"
  account_replication_type   = "LRS"
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_storage_share" "website_installers_share" {
     name     = var.storage_share_name  #"demo-${random_id.random_id.hex}"   #"${var.website_name}-installersfileshare"   #
     storage_account_name   = azurerm_storage_account.my-storage.name   
     quota                  = 50 
} 