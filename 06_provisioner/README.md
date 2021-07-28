1. terraform console - interactive environment to run and evaluate Terraform expressions

e.g., getting public IP of a instance:

google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
