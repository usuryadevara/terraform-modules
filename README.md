Commands:
## Terraform workspaces
$terraform workspace new {dev/val/uat/prod}

## Terraform workspaces Initilize the workspace with backend with corrent env
```sh
$git clone https://repourl
$terraform init
$terraform workspace new {dev/val/uat/prod}
$terraform workspace select dev
$terraform plan -var-file=-var-file=workspaces/dev/dev.tfvars
$terraform apply -var-file=-var-file=workspaces/dev/dev.tfvars
$terraform destroy -var-file=-var-file=workspaces/dev/dev.tfvars
````