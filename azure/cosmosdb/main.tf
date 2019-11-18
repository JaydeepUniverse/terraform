provider "azurerm" {
	version         = "=1.36.0"
    subscription_id = "${var.subscription_id}"
}

resource "azurerm_resource_group" "j47184DevOpsDev" {
  name     = "${var.resource_group_name}"
  location = "${var.resource_group_location}"
}

resource "azurerm_cosmosdb_account" "j47184uw2ddevcdb1" {
  name                = "47184uw2ddevcdb1"
  location            = "${var.resource_location}"
  resource_group_name = "${var.resource_group_name}"
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = "${var.resource_location}"
    failover_priority = 0
  }
  
  tags = {
	EmployeeID = "${var.tag_EmployeeID}"
	Purpose = "${var.tag_Purpose}"
  }
}
