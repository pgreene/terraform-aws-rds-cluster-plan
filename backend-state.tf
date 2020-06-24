// Uncommenet section below if you plan on using an S3 bucket for you state files
// Highly recommended to have some sort of state file management if there's shared development

//terraform {
//  backend "s3" {
//    profile = "local-aws-profile"
//    bucket  = "s3-state-file-bucket"
//    region  = "eu-west-1"
//  }
//}
