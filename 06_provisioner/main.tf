provider "google" {
    zone = "us-central1-c"
}

resource "google_compute_instance" "vm" {

    name         = "vm2"
    machine_type = "f1-micro"

    boot_disk {
      initialize_params {
          image = "debian-cloud/debian-10"
      }
    }

    network_interface {
      network = "default"
      access_config {
          // creates a public IP for the instance
      }

    }

    // This script will be executed when this resource has been created
    // the script execution is tied to the lifecycle of this resource
    provisioner "local-exec" {
        // starts a script locally (the same machine where Terraform runs)
        when = create
        // when = destroy // "clean-up" script after the resource has been destroyed
        command = "echo ${google_compute_instance.vm.network_interface[0].access_config[0].nat_ip}"            
    }
}

output "public_ip" {
    value = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}
