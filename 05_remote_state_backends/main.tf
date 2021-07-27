# My infrastructure: 1 single VM
# f1-micro, default debian image

provider "google" {
    zone = "us-central1-c"
}

# resource <resource type> <name>
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


