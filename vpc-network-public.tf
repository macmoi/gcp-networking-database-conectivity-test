resource "google_compute_network" "lunita-public-vpc" {
  name                    = "lunita-public-vpc"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "lunita-public-subnet-1" {
  name          = "lunita-public-subnet-1"
  ip_cidr_range = var.subnet_cidr_public
  network       = google_compute_network.lunita-public-vpc.name
  region        = var.region
}
