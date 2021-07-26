provider "google" {
    region  = "us-central1"
    zone    = "us-central1-c"
}

resource "google_compute_instance" "instance_1" {
    count        = 1
    name         = "instance-by-terraform"
    machine_type = "f1-micro"    

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-10"
        }
    }

    network_interface {
        network = "default"
    }
}
