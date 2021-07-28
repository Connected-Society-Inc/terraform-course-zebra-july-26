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

    metadata = {
        "ssh-keys" = "root:${file("test_key.pub")}"
    }

    // This script will be executed when this resource has been created
    // the script execution is tied to the lifecycle of this resource
    provisioner "local-exec" {
        // starts a script locally (the same machine where Terraform runs)
        when = create
        // when = destroy // "clean-up" script after the resource has been destroyed
        command = "echo ${google_compute_instance.vm.network_interface[0].access_config[0].nat_ip}"            
    }

    provisioner "remote-exec" {
        connection {
            type        = "ssh"
            host        = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
            user        = "root"
            private_key = file("test_key")
        }
        inline = ["echo 'Hello from the instance!'", "echo 'This is an another command'"]
    }

}

resource "null_resource" "dummy_resource" {
    provisioner "local-exec" {
        command = "echo 'Hello World!'"    
    }
}

output "public_ip" {
    value = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}
