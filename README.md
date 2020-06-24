# terraform-aws-rds-cluster-plan
terraform plan using terraform-aws-rds-cluster &amp; terraform-aws-rds-cluster-parameter-group-modules

## Usage
* Clone this repo to set up an aurora serverless rds cluster! [terraform-aws-rds-cluster-plan](https://github.com/pgreene/terraform-aws-rds-cluster-plan)
* update provider.tf to reflect your config
```bash
# SSH or HTTPS clone, whatever you prefer:
git clone https://github.com/pgreene/terraform-aws-rds-cluster-plan.git
git clone git@github.com:pgreene/terraform-aws-rds-cluster-plan.git
# modify main.tf to suit your settings
terraform init
terraform workspace list
terraform workspace new prod # or whatever you want your workspace to be called - examples: dev, qa, prod
terraform validate
terraform apply
```

## Terraform Modules Used
* [terraform-aws-rds-cluster](https://github.com/pgreene/terraform-aws-rds-cluster)
* [terraform-aws-security-group](https://github.com/pgreene/terraform-aws-security-group)
* [terraform-aws-security-group-rule](https://github.com/pgreene/terraform-aws-security-group-rule)
* [terraform-aws-rds-cluster-parameter-group](https://github.com/pgreene/terraform-aws-rds-cluster-parameter-group)
