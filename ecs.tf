module "ecs_cluster" {
  for_each = toset(["tf-${var.env_type}-${var.product_line}-az", "tf-${var.env_type}-${var.product_line}-pz", "tf-${var.env_type}-${var.product_line}-dz"])
  source = "./modules/ecs"
  name = "${each.key}"
  container_insights = true
  tags = merge(
    {
      Name = "tf-${each.key}"
    },
    local.common_tags,
    )
}
# module "ecs_cluster" {
#   name = "tf-${var.env_type}-${var.product_line}-az"
#   setting {
#     name  = "containerInsights"
#     value = "enabled"
#   }
#     tags = merge(var.common_tags,
#     { Name = "tf-${var.env_type}-${var.product_line}-az" }
#   )
# }

# module "ecs_cluster" {
#   name = "tf-${var.env_type}-${var.product_line}-pz"
#   setting {
#     name  = "containerInsights"
#     value = "enabled"
#   }
#     tags = merge(var.common_tags,
#     { Name = "tf-${var.env_type}-${var.product_line}-pz" }
#   )
# }

# module "ecs_cluster" {
#   name = "tf-${var.env_type}-${var.product_line}-dz"
#   setting {
#     name  = "containerInsights"
#     value = "enabled"
#   }
#     tags = merge(var.common_tags,
#     { Name = "tf-${var.env_type}-${var.product_line}-dz" }
#   )
# }
