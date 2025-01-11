variable "name" {
  description = "The name of the Application Gateway."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location of the resource group."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the Application Gateway."
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier of the Application Gateway."
  type        = string
}

variable "sku_capacity" {
  description = "The capacity of the Application Gateway."
  type        = number
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "frontend_port" {
  description = "The port number of the frontend port."
  type        = number
}

variable "cookie_based_affinity" {
  description = "The cookie-based affinity setting."
  type        = string
}

variable "backend_http_settings_port" {
  description = "The port number of the backend HTTP settings."
  type        = number
}

variable "backend_http_settings_protocol" {
  description = "The protocol of the backend HTTP settings."
  type        = string
}

variable "backend_http_settings_request_timeout" {
  description = "The request timeout of the backend HTTP settings."
  type        = number
}

variable "http_listener_protocol" {
  description = "The protocol of the HTTP listener."
  type        = string
}

variable "request_routing_rule_type" {
  description = "The type of the request routing rule."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}
