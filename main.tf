module "network" {
    source = "./network"
    direction = var.direction
    source_ranges = var.source_ranges
    protocol = var.protocol
    firewall_name = var.firewall_name
    ports = var.ports
    router_name = var.router_name
    nat_name = var.nat_name
    nat_ip_allocate_option = var.nat_ip_allocate_option
    source_subnetwork_ip_ranges_to_nat_name = var.source_subnetwork_ip_ranges_to_nat_name
    vpc_name = var.vpc_name
    auto_create_subnetworks = var.auto_create_subnetworks
    routing_mode = var.routing_mode
    mtu = var.mtu
    management_subnet_name = var.management_subnet_name
    ip_cidr_range_mang = var.ip_cidr_range_mang
    region_mang = var.region_mang
    private_ip_google_access_mang = var.private_ip_google_access_mang
    restricted_subnet_name = var.restricted_subnet_name
    ip_cidr_range_res = var.ip_cidr_range_res
    region_res = var.region_res
    private_ip_google_access_res = var.private_ip_google_access_res
}

module "service_account" {
    source = "./service_account"
    service_account_gke_name = var.service_account_gke_name
    project = var.project
    gke_role = var.gke_role
    service_account_vm_name = var.service_account_vm_name
    vm_role = var.vm_role 
}

module "vm" {
    source = "./vm"
    vm_name = var.vm_name
    vm_machine_type = var.vm_machine_type
    vm_machine_image = var.vm_machine_image
    zone = var.zone
    network = module.network.vpc_id
    subnetwork = module.network.management_subnet_id
    service_account_email = module.service_account.vm_service_account
    
}