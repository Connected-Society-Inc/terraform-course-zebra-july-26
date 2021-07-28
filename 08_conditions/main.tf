provider "google" {
    zone = "us-central1-c"
}

variable "debian_version" {
    type = number
    default = 10
    # but 9 can be also an option
}

variable "create_instance" {
    type    = bool
    default = true
}

resource "google_compute_instance" "instance" {

    // if create_instance == true => 1x instance else 0x instance
    count = var.create_instance ? 1 : 0 # conditional resource creation

    machine_type = "f1-micro" # required attribute
    name         = "instance-by-terraform"
    
    boot_disk {
        initialize_params {
            image = var.debian_version == 10 ? "debian-cloud/debian-10" : "debian-cloud/debian-9"
        }
    }

    network_interface {
        network = "default"
        access_config {
          
        }
    }    
}


