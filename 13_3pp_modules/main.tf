provider "google" {
    zone = "us-central1-c"    
}

module "network" {
    source  = "terraform-google-modules/network/google"
    version = "3.3.0"
    
    // parameters of the module
    // https://registry.terraform.io/modules/terraform-google-modules/network/google/latest?tab=inputs
    network_name = "terraform-vpc"
    project_id   = "tf-gcp-training"
    subnets = [
        {
            subnet_name  = "public"
            subnet_ip    = "10.0.1.0/24"
            subnet_region = "us-central1"
        },
        {
            subnet_name  = "private"
            subnet_ip    = "10.0.2.0/24"
            subnet_region = "us-central1"
        }
    ]
}
