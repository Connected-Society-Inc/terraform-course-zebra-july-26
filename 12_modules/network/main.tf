resource "google_compute_network" "vpc" {    
    name                    = var.network_name
    auto_create_subnetworks = false
}

// Subnet
resource "google_compute_subnetwork" "subnet" {
    name          = var.subnet_name
    ip_cidr_range = var.subnet_cidr
    network       = google_compute_network.vpc.id
}
