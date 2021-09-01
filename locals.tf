locals {
    env = "dev"
    owner = "pgreene"
    tags = {
        Environment = local.env
        Owner = local.owner
    }
}
