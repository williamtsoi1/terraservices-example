# Complete your provider information here
# Full list of providers: https://www.terraform.io/docs/providers/index.html
provider "aws" {
    # provider parameters here. Override any secrets at run time and avoid storing them in source control
    access_key = ""
    secret_key = ""
    region = ""
}

# Make a single call to the component module in the modules folder of this repo.
# Do not create any resources nor reference other modules here.
# That belongs in ../../../modules/core/core.tf
module "core" {
    source = "../../../modules/core"
    # other variables to be passed in go here
    environment_name = "${var.environment_name}"
    component_name = "${var.component_name}"
}


terraform {
    backend "s3" {
        bucket = "williamtsoi-terraform-remote-state"
        key    = "terraform-remote-state/production/core/terraform.tfstate"
        region = "ap-southeast-2"
    }
}

data "terraform_remote_state" "compute" {
    backend = "s3"
    config {
        bucket = "williamtsoi-terraform-remote-state"
        key    = "terraform-remote-state/production/compute/terraform.tfstate"
        region = "ap-southeast-2"
    }
}

data "terraform_remote_state" "data" {
    backend = "s3"
    config {
        bucket = "williamtsoi-terraform-remote-state"
        key    = "terraform-remote-state/production/data/terraform.tfstate"
        region = "ap-southeast-2"
    }
}
