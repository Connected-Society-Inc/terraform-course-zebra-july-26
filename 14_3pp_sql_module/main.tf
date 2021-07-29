provider "google" {
    zone = "us-central1-c"
}

module "db" {
  source  = "GoogleCloudPlatform/sql-db/google//examples/mysql-public"
  version = "6.0.0"
  # insert the 1 required variable here
  // https://registry.terraform.io/modules/GoogleCloudPlatform/sql-db/google/latest/examples/mysql-public?tab=inputs
  project_id = "tf-gcp-training"
  db_name = "db123"
}

output "password" {
    value = module.db.mysql_user_pass
    sensitive = true
}

output "connstring" {
    value = module.db.mysql_conn    
}
