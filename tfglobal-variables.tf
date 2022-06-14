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

## Security Groups ##
variable "vpcid" {
  type        = string
  default     = ""
  description = "Enter the VPC ID for Security Group"
}

variable "dz_trusted_ip_subnets" {
  type        = list(string)
  default     = []
  description = "DZ Trusted subnets"
}

variable "az_trusted_ip_subnets" {
  type        = list(string)
  default     = []
  description = "AZ private Trusted subnets"
}

variable "pz_trusted_ip_subnets" {
  type        = list(string)
  default     = []
  description = "PZ private Trusted subnets"
}

variable "greenfield_epor_az1_az2"{
  type        = list(string)
  default     = []
  description = "greenfield_epor_az1_az2"
}

variable "greenfield_epor_az3"{
  type        = list(string)
  default     = []
  description = "greenfield_epor_az3"
}

variable "greenfield_legacy"{
  type        = list(string)
  default     = []
  description = "greenfield_legacy"
}

variable "vpc_cidr1_2"{
  type        = list(string)
  default     = []
  description = "vpc_cidr1_2"
}

variable "parameter_write" {
  type        = list(map(string))
  description = "List of maps with the parameter values to write to SSM Parameter Store"
}

variable "parameter_read" {
  type        = list(string)
  description = "List of parameters to read from SSM. These must already exist otherwise an error is returned. Can be used with `parameter_write` as long as the parameters are different."
  default     = []
}