variable "rg-name" {}
variable "location" {}
#variable "name" {}
variable "python_version" {}
variable "app-location" {}
variable "service_plan_id" {} 
variable "app_insights_instrumentation_key" {
    type        = string
    default     = "my-instrumentation-key"
    description = "name of the Instrumentation key which is going to be created"
}
variable "app-insights_connectionstring" {}
variable "storage_account_name" {}
variable "access_key" {}
variable "share-file-name" {}
variable "linux_web-app-name" {}
