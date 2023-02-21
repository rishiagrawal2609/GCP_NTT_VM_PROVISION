terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}
resource "google_compute_instance" "main" {
  name = var.Vmname
  machine_type = var.machine_type
  zone = var.zone
  tags = var.tags
  boot_disk {
    initialize_params {
      image = var.OSimage
      size = var.diskSize
    }
    auto_delete = var.auto_delete
    device_name = var.diskName
    mode = var.diskMode
    source = var.source
  }
  network_interface {
    network = var.myVmNet
    subnetwork = var.mySubNet
    subnetwork_project = var.subnetwork_project
    network_ip = var.networkip
    access_config {
      nat_ip = var.nat_ip
    }
    alias_ip_range {
      ip_cidr_range = var.ip_cidr_range_alias
    }
  }
  can_ip_forward = var.can_ip_forward
  description = var.description
  desired_status = var.desired_status
  deletion_protection = var.deletion_protection
  hostname = var.hostname
  labels = var.labels
  metadata = var.metadata
  metadata_startup_script = var.metadata_startup_script
  project = var.project
  
  # service_account {
  #   email = ""
  #   scope = ""
  # }
  shielded_instance_config {
    enable_secure_boot = var.enable_secure_boot
    enable_integrity_monitoring = var.enable_integrity_monitoring
    enable_vtpm = var.enable_vtpm
  }

}