# terraform-aws-rds-cluster-plan
terraform plan using terraform-aws-rds-cluster &amp; terraform-aws-rds-cluster-parameter-group-modules

## Usage
* Clone this repo to test this module with others to set up an aurora serverless rds cluster! [terraform-aws-rds-cluster-plan](https://github.com/pgreene/terraform-aws-rds-cluster-plan)
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
