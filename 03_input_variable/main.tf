provider "google" {
    zone = "us-central1-c"
}

resource "google_compute_instance" "instance" {

    machine_type = "f1-micro" # required attribute
    name         = "instance-by-terraform"
    
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-10"
        }
    }

    network_interface {
        network = "default"
    }    
}

