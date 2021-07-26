// VPC
resource "google_compute_network" "vpc" {    
    name                    = "terraform"
    auto_create_subnetworks = false
}

// Subnet
resource "google_compute_subnetwork" "subnet" {
    name          = "terraform-subnet"
    ip_cidr_range = "10.1.1.0/24"
    network       = google_compute_network.vpc.id
}
