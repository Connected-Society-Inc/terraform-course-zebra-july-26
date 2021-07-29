provider "google" {
    zone = "us-central1-c"
}

// google_sql_database_instance
resource "google_sql_database_instance" "db" {
    name             = "terraform-db"
    database_version = "POSTGRES_11"

    settings {
        tier = "db-f1-micro"
    }
}

data "google_secret_manager_secret_version" "db_password" {
    secret = "db-password"
}

// google_sql_user
resource "google_sql_user" "admin_user" {
    name     = "admin"
    instance = google_sql_database_instance.db.name
    password = data.google_secret_manager_secret_version.db_password.secret_data
}

// google_sql_database

output "password" {
    value = google_sql_user.admin_user.password
    sensitive = true
}
