resource "google_compute_instance" "private-vm" {
  name         = "private-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = google_compute_network.project-vpc.id
    subnetwork = google_compute_subnetwork.management-subnet.id
  }

}