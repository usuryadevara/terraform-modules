locals {
  common_tags = {
    EnvType            = var.env_type
    MaintenanceContact = var.maintenance_contact
    ProductLine        = var.product_line
    Provisioner        = var.provisioner
    OwnerContact       = var.owner_contact
  }
}