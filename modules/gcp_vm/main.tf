provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
}

resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

#   tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network

    access_config {
      // Ephemeral IP
    }
  }

#   metadata = {
#     foo = "bar"
#   }

#   metadata_startup_script = "echo hi > /test.txt"

#   service_account {
#     scopes = ["userinfo-email", "compute-ro", "storage-ro"]
#   }
}

# Making the service account and IAM binding
# gcloud projects add-iam-policy-binding train-sandbox \
#   --member serviceAccount:default@train-sandbox.iam.gserviceaccount.com \
#   --role roles/compute.admin
