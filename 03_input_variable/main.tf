provider "google" {
    zone = "us-central1-c"
}

resource "google_compute_instance" "instance" {

    machine_type = "f1-micro" # required attribute
    name         = "${var.env_name}-instance"
    
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-10"
        }
    }

    network_interface {
        network = "default"
    }    
}

