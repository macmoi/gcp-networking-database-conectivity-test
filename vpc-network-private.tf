resource "google_compute_network" "lunita-private-vpc" {
  name                    = "lunita-private-vpc"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "lunita-private-subnet-1" {
  name          = "lunita-private-subnet-1"
  ip_cidr_range = var.subnet_cidr_private
  network       = google_compute_network.lunita-private-vpc.name
  region        = var.region
}
