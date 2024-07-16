# ALLOW SSH RULE
resource "google_compute_firewall" "private-allow-ssh" {
  name    = "${google_compute_network.lunita-private-vpc.name}-allow-ssh"
  network = google_compute_network.lunita-private-vpc.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["${var.subnet_cidr_public}"]
  target_tags   = ["allow-ssh"]
}

# ALLOW RDP RULE
resource "google_compute_firewall" "private-allow-rdp" {
  name    = "${google_compute_network.lunita-private-vpc.name}-allow-rdp"
  network = google_compute_network.lunita-private-vpc.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  source_ranges = ["${var.subnet_cidr_public}"]
  target_tags   = ["allow-rdp"]
}

# ALLOW ICMP RULE
resource "google_compute_firewall" "private-allow-icmp" {
  name    = "${google_compute_network.lunita-private-vpc.name}-allow-icmp"
  network = google_compute_network.lunita-private-vpc.name
  allow {
    protocol = "icmp"
  }
  source_ranges = ["${var.subnet_cidr_public}"]
  target_tags   = ["allow-icmp"]
}
