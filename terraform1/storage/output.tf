output "storage_account_name" {
  value = azurerm_storage_account.my-storage.name
}


output "primary_access_key"{
    value = azurerm_storage_account.my-storage.primary_access_key
}

output "share-file-name" {
    value = azurerm_storage_share.website_installers_share.name
  
}


#azurerm_storage_account.my-storage.primary_access_key
#azurerm_storage_share.website_installers_share.name