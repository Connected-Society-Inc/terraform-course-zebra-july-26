provider "google" {
    zone = "us-central1-c"
}

module "webserver" {
    // github repo link:https://github.com/garzoand/terraform_module
    source = "github.com/garzoand/terraform_module/modules/webserver"
    
    instance_name = "web-server"
}