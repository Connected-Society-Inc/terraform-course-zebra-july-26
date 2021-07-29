variable "instance_name" {
    type = string
}

variable "machine_type" {
    type    = string
    default = "f1-micro"
}

variable "subnet_id" {  
    type = string
}
