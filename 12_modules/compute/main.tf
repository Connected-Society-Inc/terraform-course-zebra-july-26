resource "google_compute_instance" "instance" {
    machine_type = var.machine_type
    name         = var.instance_name
    
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-10"
        }
    }

    network_interface {
        # network = "default"
        subnetwork = var.subnet_id
        access_config {
          
        }
    }    

}

