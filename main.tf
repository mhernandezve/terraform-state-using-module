terraform {
  backend "s3" {
    bucket  = "tfstate-mhg"
    key     = "modules/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

module "storage-mod" {
  source       = "./modules/storage"
  bucket_name  = "mhg-storage-mod"
  region       = "us-east-1"
  acl          = "private"
  allow_access = ["arn:aws:iam::112830045092:user/miguel.globant"]
  versioned    = "Enabled"
}


