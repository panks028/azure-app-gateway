# azure-app-gateway
for creating application gateway in azure

Please update below values in terraform.tfvars

name                           = "myAppGateway"             #Name of Application Gateway
resource_group_name            = "rg-name"                  #Name of Your Resource Group
location                       = "East US"                  #Location/Region
sku_name                       = "Standard_v2"
sku_tier                       = "Standard"
sku_capacity                   = 2
virtual_network_name           = "vNet-name"                #Existing VNET Name
subnet_name                    = "sNet-name"                #Existing Subnet Name
frontend_port                  = 80
cookie_based_affinity          = "Disabled"
backend_http_settings_port     = 80
backend_http_settings_protocol = "Http"
backend_http_settings_request_timeout = 20
http_listener_protocol         = "Http"
request_routing_rule_type      = "Basic"
tags = {
  Environment = "Production"
  Project     = "MyProject"
}

For maintaining the backend terraform state in cloud , please update backend.tf. This way you can maintain the state of several environments in one Backend Storage.

terraform {
  backend "azurerm" {
    resource_group_name   = "tfstorage-rg"             ###Backend Storage Account's Resource Group
    storage_account_name  = "tfstorageacct"            ###Backend Storage Account's Name
    container_name        = "tfstorecont"              ###Backend Storage Blob Container Name
    key                   = "env_name.tfstate"         ###Per Environment state to be file stored.
  }
}

=============================================
export azure credentials

terraform init

terraform plan

terraform apply
