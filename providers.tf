#############################################################################
# TERRAFORM CONFIG
#############################################################################


provider "azurerm" {

  features {}
}

provider "azuread" {
  user_name       = var.user_name
  password        = var.password
  subscription_id = var.subscription_id
}