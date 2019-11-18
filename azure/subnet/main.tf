provider "azurerm" {
	version         = "=1.36.0"
    subscription_id = "${var.subscription_id}"
}

resource "azurerm_resource_group" "j47184DevOpsDev" {
  name     = "${var.resource_group_name}"
  location = "${var.resource_group_location}"
}

resource "azurerm_virtual_network" "j47184UW2DDevVNT1" {
  name 				  = "47184UW2DDevVNT1"
  location            = "${var.resource_location}"
  resource_group_name = "${var.resource_group_name}"
  address_space       = ["172.18.0.0/16"]
}

resource "azurerm_subnet" "j47184UW2DDevSBN4" {
  name                 = "47184UW2DDevSBN4"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.j47184UW2DDevVNT1.name}"
  address_prefix       = "172.18.3.0/24"
  service_endpoints	   = ["Microsoft.AzureCosmosDB"]
}

terraform {
  backend "azurerm" {
    storage_account_name  = "47184uw2ddevsta1"
    container_name        = "terraform"
    key                   = "subnet/terraform.tfstate"
  }
}
