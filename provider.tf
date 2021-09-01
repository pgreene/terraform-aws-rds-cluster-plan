provider "aws" {
  region = eu-west-1
  access_key = "AAAAAAAAAABBBB"
  secret_key = "BBBBBBBBBBCCCCCCCCC"
}

//OR

provider "aws" {
  profile = "local-aws-profile"
  region = "eu-west-1"
}
