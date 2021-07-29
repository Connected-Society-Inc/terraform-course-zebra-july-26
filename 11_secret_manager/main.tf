provider "google" {
    zone = "us-central1-c"
}

resource "google_secret_manager_secret" "secret" {
    secret_id = "terraform-secret2"
    replication {
        automatic = true
    }    
}

resource "google_secret_manager_secret_version" "secret_data" {
    secret      = google_secret_manager_secret.secret.id
    secret_data = "super-secret-password"
}
