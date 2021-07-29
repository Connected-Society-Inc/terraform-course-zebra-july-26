provider "google" {
    zone = "us-central1-c"
}

module "network" {
    source = "./network/"
    network_name = "terraform-vpc"
    subnet_cidr = "10.0.1.0/24"
}

module "compute" {
    source = "./compute/"
    instance_name = "module-tf"
    subnet_id = module.network.subnet_id
}
