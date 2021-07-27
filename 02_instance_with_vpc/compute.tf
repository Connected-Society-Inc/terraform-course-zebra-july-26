// VM
resource "google_compute_instance" "instance" {

    machine_type = "f1-micro" # required attribute
    name         = "instance-by-terraform-2"
    
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-10"
        }
    }

    network_interface {
        # network = "default"
        subnetwork = google_compute_subnetwork.subnet.id
    }    

    labels = {
        "project" = "terraform-course",
        "org" = "development"     
    }

}

