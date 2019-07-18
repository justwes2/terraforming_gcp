module "gcp_server" {
  # metadata
  source = "../modules/gcp_vm"
  # provider
  # credentials = "${file("~/.ssh/sandbox-fda77da299d1.json")}"
  # project     = "sandbox-245021"
  credentials = "${file("~/.ssh/sts-train-sandbox-default.json")}"
  project = "train-sandbox"
  region      = "us-east4"
  # resource
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-east4-a"
  image = "debian-cloud/debian-9"
  network = "default"
}