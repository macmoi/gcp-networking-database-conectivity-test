# ALLOW SSH RULE

resource "google_compute_firewall" "public-allow-ssh" {
  name    = "${google_compute_network.lunita-public-vpc.name}-allow-ssh"
  network = google_compute_network.lunita-public-vpc.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ssh"]
}

# ALLOW RDP RULE
resource "google_compute_firewall" "public-allow-rdp" {
  name    = "${google_compute_network.lunita-public-vpc.name}-allow-rdp"
  network = google_compute_network.lunita-public-vpc.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  source_ranges = [
    "0.0.0.0/0"
  ]
  target_tags = ["allow-rdp"]
}

# ALLOW ICMP RULE
resource "google_compute_firewall" "public-allow-icmp" {
  name    = "${google_compute_network.lunita-public-vpc.name}-allow-icmp"
  network = google_compute_network.lunita-public-vpc.name
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-icmp"]
}
