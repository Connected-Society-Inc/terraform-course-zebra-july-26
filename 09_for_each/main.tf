provider "google" {
    zone = "us-central1-c"
}

locals {
    // instance_count = 3
    instance_names = ["adam", /*"bob",*/ "cecile"]
}

/*
    count: 
        for i in 0 .. length(instance_names):
            instance_names[i] # i <- 0, i <- 1, i <- 2

    for_each:
        for i in instance_names:
           i # i <- adam, i <- bob, i <- cecile
*/

resource "google_compute_instance" "instance" {

    for_each = toset(local.instance_names)

    machine_type = "f1-micro"
    name         = each.value
    
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-10"
        }
    }

    network_interface {
        network = "default"
    }    
}
