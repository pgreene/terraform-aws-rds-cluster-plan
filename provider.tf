provider "aws" {
  region = eu-west-1
  access_key = "AAAAAAAAAABBBB"
  secret_key = "BBBBBBBBBBCCCCCCCCC"
}

//OR

provider "aws" {
  profile = "local-aws-profilee"
  region     = "eu-west-1"
}
