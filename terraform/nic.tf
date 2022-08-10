


resource "azurerm_network_interface" "lavoro" {

  for_each            = toset(var.Role)
  name                = each.value
  location            = azurerm_resource_group.lavoro.location
  resource_group_name = azurerm_resource_group.lavoro.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.lavoro.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.lavoro[each.key].id
  }
}

resource "azurerm_public_ip" "lavoro" {
  for_each            = toset(var.Role)
  name                = each.value
  resource_group_name = azurerm_resource_group.lavoro.name
  location            = azurerm_resource_group.lavoro.location
  allocation_method   = "Static"
}