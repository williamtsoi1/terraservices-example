# Complete your provider information here
# Full list of providers: https://www.terraform.io/docs/providers/index.html
provider "aws" {
    # provider parameters here. Override any secrets at run time and avoid storing them in source control
    access_key = ""
    secret_key = ""
    region = "${var.aws_region}"
}

# Make a single call to the component module in the modules folder of this repo.
# Do not create any resources nor reference other modules here.
# That belongs in ../../../modules/compute/compute.tf
module "compute" {
    source = "../../../modules/compute"
    subnets = ["${data.terraform_remote_state.core.private_subnets}"]
    cluster_max_size = "${var.cluster_max_size}"
    cluster_min_size = "${var.cluster_min_size}"
    cluster_desired_size = "${var.cluster_desired_size}"
    instance_type = "${var.instance_type}"
}


terraform {
    backend "s3" {
        bucket = "williamtsoi-terraform-remote-state"
        key    = "terraform-remote-state/staging/compute/terraform.tfstate"
        region = "ap-southeast-2"
    }
}

data "terraform_remote_state" "core" {
    backend = "s3"
    config {
        bucket = "williamtsoi-terraform-remote-state"
        key    = "terraform-remote-state/staging/core/terraform.tfstate"
        region = "ap-southeast-2"
    }
}

data "terraform_remote_state" "data" {
    backend = "s3"
    config {
        bucket = "williamtsoi-terraform-remote-state"
        key    = "terraform-remote-state/staging/data/terraform.tfstate"
        region = "ap-southeast-2"
    }
}
