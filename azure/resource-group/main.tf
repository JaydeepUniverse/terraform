provider "azurerm" {
    version         = "=1.36.0"
    subscription_id = "${var.subscription_id}"
}

resource "azurerm_resource_group" "j47184DevOpsDev" {
  name     = "${var.resource_group_name}"
  location = "${var.resource_group_location}"
  
  tags = {
	EmployeeID = "${var.tag_EmployeeID}"
	Purpose = "${var.tag_Purpose}"
  }
}

terraform {
  backend "azurerm" {
    storage_account_name  = "47184uw2ddevsta1"
    container_name        = "terraform"
    key                   = "resource-group/terraform.tfstate"
  }
}
