provider "azurerm" {
	version         = "=1.36.0"
    subscription_id = "${var.subscription_id}"
}

resource "azurerm_resource_group" "j47184DevOpsDev" {
  name     = "${var.resource_group_name}"
  location = "${var.resource_group_location}"
}

resource "azurerm_storage_account" "j47184uw2ddevsta1" {
  name                     	= "47184uw2ddevsta1"
  resource_group_name      	= "${var.resource_group_name}"
  location                 	= "${var.resource_location}"
  access_tier			   	= "Hot"
  account_tier			   	= "Standard"
  account_kind			   	= "StorageV2"
  account_replication_type 	= "LRS"
  enable_https_traffic_only = true

  tags = {
	EmployeeID = "${var.tag_EmployeeID}"
	Purpose = "${var.tag_Purpose}"
  }
}

resource "azurerm_storage_container" "terraform" {
  name                  = "terraform"
  storage_account_name  = "${azurerm_storage_account.j47184uw2ddevsta1.name}"
  container_access_type = "private"
}
