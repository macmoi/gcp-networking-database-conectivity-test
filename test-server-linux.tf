resource "google_compute_instance" "test-server-linux" {
    name = "public-test-server-linux-${random_id.instance_id.hex}"
    machine_type = "e2-medium"
    zone = var.zone
    tags = [ "allow-ssh" ]
    
    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"
      }
    }

    metadata_startup_script = "apt-get update;"

    network_interface {
      network = google_compute_network.lunita-public-vpc.name
      subnetwork = google_compute_subnetwork.lunita-public-subnet-1.name
      access_config {
        // Ephemeral IP
      }
    }
}

resource "google_compute_instance" "test-server-linux-private" {
    name = "private-test-server-linux-${random_id.instance_id.hex}"
    machine_type = "e2-medium"
    zone = var.zone
    tags = [ "allow-ssh" ]
    
    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"
      }
    }

    metadata_startup_script = "apt-get update;"

    network_interface {
      network = google_compute_network.lunita-private-vpc.name
      subnetwork = google_compute_subnetwork.lunita-private-subnet-1.name
      access_config {
        // Ephemeral IP
      }
    }
}

output "test-server-linux" {
    value = google_compute_instance.test-server-linux.name
}

output "test-server-linux-public-ip" {
    value = google_compute_instance.test-server-linux.network_interface.0.access_config.0.nat_ip  
}

output "test-server-linux-internal-ip" {
    value = google_compute_instance.test-server-linux.network_interface.0.network_ip
}