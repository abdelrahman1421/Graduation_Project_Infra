resource "google_compute_network" "project-vpc" {
  name                    = "project-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  mtu                     = 1460
}
