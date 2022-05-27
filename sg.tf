## DZ security Group ##
module "dz_sg" {
  source = "./modules/security_group"
  name                   = "tf-${var.env_type}-${var.product_line}-dz-sg"
  description            = "Traffic rules for Data Zone"
  vpc_id                 = var.vpcid
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  ingress_with_cidr_blocks = [
      {
        from_port                = 5432
        to_port                  = 5432
        protocol                 = "tcp"
        description              = "Data Zone Subnets 1a/1b/1c"
        cidr_blocks              = join(",",var.dz_trusted_ip_subnets)
      }
  ]
  ingress_with_source_security_group_id = [
      {
       from_port                = 0
       to_port                  = 0
       protocol                 = "-1"
       source_security_group_id = module.dz_sg.security_group_id
       description              = "Allow traffic from self"
      },
      {
       from_port                = 5432
       to_port                  = 5432
       protocol                 = "tcp"
       source_security_group_id = module.az_sg.security_group_id
       description              = "Allow from Application Zone"
      }
  ]
  tags = merge(
    {
      Name = "tf-${var.env_type}-${var.product_line}-dz-sg"
    },
    local.common_tags,
    )
}

## AZ security Group ##
module "az_sg" {
  source = "./modules/security_group"
  name                   = "tf-${var.env_type}-${var.product_line}-az_sg"
  description            = "Traffic rules for Application Zone"
  vpc_id                 = var.vpcid
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  ingress_with_cidr_blocks = [
      {
        from_port                = 8080
        to_port                  = 9990
        protocol                 = "tcp"
        description              = "Application Zone Subnets 1a/1b/1c"
        cidr_blocks              = join(",",var.az_trusted_ip_subnets)
      }
  ]
  ingress_with_source_security_group_id = [
      {
       from_port                = 22
       to_port                  = 22
       protocol                 = "tcp"
       source_security_group_id = module.az_sg.security_group_id
       description              = "SSH"
      },
      {
       from_port                = 8080
       to_port                  = 9990
       protocol                 = "tcp"
       source_security_group_id = module.internal_lb_sg.security_group_id
       description              = "FROM LB"
      }
  ]
  tags = merge(
    {
      Name = "tf-${var.env_type}-${var.product_line}-az_sg"
    },
    local.common_tags,
    )
}

module "pz_sg" {
  source = "./modules/security_group"
  name                   = "tf-${var.env_type}-${var.product_line}-pz_sg"
  description            = "Traffic rules for Presentation Zone"
  vpc_id                 = var.vpcid
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  ingress_with_cidr_blocks = [
      {
        from_port                = 8080
        to_port                  = 9990
        protocol                 = "tcp"
        description              = "Application Zone Subnets 1a/1b/1c"
        cidr_blocks              = join(",",var.az_trusted_ip_subnets)
      },
      {
        from_port                = 8080
        to_port                  = 9990
        protocol                 = "tcp"
        description              = "Presentation Zone Subnets 1a/1b/1c"
        cidr_blocks              = join(",",var.pz_trusted_ip_subnets)
      }
  ]
  ingress_with_source_security_group_id = [
      {
       from_port                = 8080
       to_port                  = 9990
       protocol                 = "tcp"
       source_security_group_id = module.lb_sg.security_group_id
       description              = "From LB"
      },
      {
       from_port                = 0
       to_port                  = 65535
       protocol                 = "tcp"
       source_security_group_id = module.pz_sg.security_group_id
       description              = "Boot strap"
      },
      {
       from_port                = 80
       to_port                  = 80
       protocol                 = "tcp"
       source_security_group_id = module.lb_sg.security_group_id
       description              = "from lb to httpd"
      },
      {
       from_port                = 3106
       to_port                  = 3106
       protocol                 = "tcp"
       source_security_group_id = module.lb_sg.security_group_id
       description              = "from lb to internal"
      },
      {
       from_port                = 3107
       to_port                  = 3107
       protocol                 = "tcp"
       source_security_group_id = module.lb_sg.security_group_id
       description              = "from lb to internal"
      }
  ]
  tags = merge(
    {
      Name = "tf-${var.env_type}-${var.product_line}-pz_sg"
    },
    local.common_tags,
    )
}

module "lb_sg" {
  source = "./modules/security_group"
  name                   = "tf-${var.env_type}-${var.product_line}-lb_sg"
  description            = "Traffic rules for LB"
  vpc_id                 = var.vpcid
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  ingress_with_cidr_blocks = [
      {
        from_port                = 443
        to_port                  = 443
        protocol                 = "tcp"
        description              = "LB traffic https"
        cidr_blocks              = "0.0.0.0/0"
      }
  ]
  tags = merge(
    {
      Name = "tf-${var.env_type}-${var.product_line}-lb_sg"
    },
    local.common_tags,
    )
}

module "internal_lb_sg" {
  source = "./modules/security_group"
  name                   = "tf-${var.env_type}-${var.product_line}-internal_lb_sg"
  description            = "Traffic rules for Data Zone "
  vpc_id                 = var.vpcid
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  ingress_with_cidr_blocks = [
      {
        from_port                = 8086
        to_port                  = 8086
        protocol                 = "tcp"
        description              = "EPOR AZ1-AZ2- Greenfield"
        cidr_blocks              = join(",",var.greenfield_epor_az1_az2)
      },
      {
        from_port                = 8086
        to_port                  = 8086
        protocol                 = "tcp"
        description              = "EPOR-AZ1-AZ2 Legacy"
        cidr_blocks              = join(",",var.greenfield_legacy)
      },
      {
        from_port                = 8080
        to_port                  = 9990
        protocol                 = "tcp"
        description              = "esMD VPC CIDR1/2"
        cidr_blocks              = join(",",var.vpc_cidr1_2)
      },
      {
        from_port                = 8086
        to_port                  = 8086
        protocol                 = "tcp"
        description              = "EPOR AZ3 Greenfield"
        cidr_blocks              = join(",",var.greenfield_epor_az3)
      }
  ]
  tags = merge(
    {
      Name = "tf-${var.env_type}-${var.product_line}-internal_lb_sg"
    },
    local.common_tags,
    )
}