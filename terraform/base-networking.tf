module vnet {
    source      = "../modules/base-networking"
    vnet_name   = "${var.vnet_name}"
    subnet_name = "${var.subnet_name}"
    subnet_cidr = "${var.subnet_cidr}"
    vnet_cidr   = "${var.vnet_cidr}"
    rg_name     = "${var.rg_name}"
}

