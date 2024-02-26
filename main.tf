resource "azurerm_public_ip" "example" {
  name                = "PublicIp1"
  resource_group_name = "dora-tf-deployment-demo"
  location            = "East US"
  allocation_method   = "Static"

  tags = {
    Owner = "o11y-demo"
  }
}
