
resource "azurerm_resource_group" "lavoro" {
  name     = var.ResourceGroup
  location = var.Location
}

resource "azurerm_virtual_network" "lavoro" {
  name                = var.VirtualNetwork
  address_space       = [var.VirtualNetworkIP]
  location            = azurerm_resource_group.lavoro.location
  resource_group_name = azurerm_resource_group.lavoro.name
}

resource "azurerm_subnet" "lavoro" {
  name                 = var.VirtualSubnet
  resource_group_name  = azurerm_resource_group.lavoro.name
  virtual_network_name = azurerm_virtual_network.lavoro.name
  address_prefixes     = [var.VirtualSubnetIP]
}