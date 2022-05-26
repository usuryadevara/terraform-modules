## Global tags ##
variable "env_type" {
  description = "One of the supported environment type values: Document URL: Server+Tagging+Policy"
  type        = string
  default     = ""
}

variable "product_line" {
  description = "Product line for which these resources are provided: Document URL: Server+Tagging+Policy"
  type        = string
  default     = "esmd"
}

# variable "product_component" {
#   description = "Product line components: Document URL: Server+Tagging+Policy"
#   type        = string
#   default = "esmd"
# }

variable "provisioner" {
  description = "One of the supported provisioner values: Document URL: Server+Tagging+Policy"
  type        = string
  default     = "terraform"
}

variable "owner_contact" {
  description = "Owner contact of resource"
  type        = string
  default     = "esmddevsecops"
}

variable "maintenance_contact" {
  description = "Maintenance contact of the resource"
  type        = string
  default     = "esmddevsecops@unissant.com"
}

## S3 variables ##
variable "epor_esmd_policy" {
  type        = string
  default     = ""
  description = "epor esmd Bucket policy"
}

variable "esmd_epor_policy" {
  type        = string
  default     = ""
  description = "esmd epor Bucket policy"
}

variable "esmd_payload_policy" {
  type        = string
  default     = ""
  description = "esmd payload Bucket policy"
}

variable "esmd_qurantine_policy" {
  type        = string
  default     = ""
  description = "esmd qurantine Bucket policy"
}