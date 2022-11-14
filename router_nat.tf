resource "google_compute_router" "router" {
  name    = "router"
  region  = google_compute_subnetwork.management-subnet.region
  network = google_compute_network.project-vpc.id
}

resource "google_compute_router_nat" "nat-gw" {
  name                               = "nat-gw"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}