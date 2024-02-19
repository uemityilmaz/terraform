terraform {
  backend "gcs" {
    bucket = "terraform-state-6891"
    prefix = "terraform/state"
  }
}

provider "google" {
  project     = "silent-fuze-412410"
}


resource "google_compute_instance" "default" {
  name         = "example-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_storage_bucket" "test-bucket-6891" {
  name     = "test-bucket-6891"
  location = "us-central1-a"
}
