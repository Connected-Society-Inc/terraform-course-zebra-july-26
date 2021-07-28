provider "google" {
    zone = "us-central1-c"
}

variable "machine_type" {
    type    = string
    default = "f1-micro"
}

variable "instance_count" {
    type    = number
    default = 2
}

resource "google_compute_instance" "instance" {

    count = var.instance_count

    machine_type = var.machine_type
    name         = "count-${count.index}"
    
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-10"
        }
    }

    network_interface {
        network = "default"
        access_config {   
        }
    }    
}

locals {
    str = "abcdef"
    str_list = ["a", "b", "c", "d"]
}

output "public_ips" {    
    value = google_compute_instance.instance[*].network_interface[0].access_config[0].nat_ip
}

output "public_ips2" {
    value = [ for instance in google_compute_instance.instance: instance.network_interface[0].access_config[0].nat_ip ]
}

output "test" {
    value = upper(local.str)
}

output "test2" {
    value = [ for s in local.str_list: upper(s) if s != "b" ]
}

/*
resource "..." "other_resource" {
    depends_on = [
      "google_compute_instance.instance"
    ]

    // ....
    // property =
}*/
