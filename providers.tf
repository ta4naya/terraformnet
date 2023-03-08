#############################################################################
# TERRAFORM CONFIG
#############################################################################


provider "azurerm" {

  features {}
}

provider "azuread" {
  client_id = var.client_id
  client_secret = var.client_secret
  subscription_id = var.subscription_id
}