module vnet {
    source      = "./modules/base-networking"
    vnet_name   = "${var.vnet_name}"
    subnet_name = "${var.subnet_name}"
    subnet_cidr = "${var.subnet_cidr}"
    rg_name =     "${var.rg_name}"
}

module provider {
  source                 = "./modules/provider"
  subscription_id        = "${var.subscription_id}"
  client_id              = "${var.client_id}"
  client_secret          = "${var.client_secret}"
  tenant_id              = "${var.tenant_id}"
}