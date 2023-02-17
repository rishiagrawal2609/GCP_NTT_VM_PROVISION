terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

resource "google_compute_network" "main" {
  name = "myVmNet"
  description = "Network for the VM"
  auto_create_subnetworks = false
  routing_mode = "GLOBAL"
  mtu = 1460
  enable_ula_internal_ipv6 = false 
  internal_ipv6_range = ""
  project = "cs-internal-cust-suc-cloudops"
  delete_default_routes_on_create = false
}
resource "google_compute_subnetwork" "main" {
  name = "subnet1"
  ip_cidr_range = ""
  network = "myVmNet"
  description = "my subnet"
  secondary_ip_range {
    range_name = "secondary IP"
    ip_cidr_range = ""
  }
  private_ip_google_access = true
  private_ipv6_google_access = false
  region = "us-central"
  stack_type = "IPV4_IPV6"
  ipv6_access_type = "INTERNAL"
  project = "cs-internal-cust-suc-cloudops"
}

resource "google_compute_instance" "main" {
  name = "vmname"
  machine_type = "e2.medium"
  zone = us-central1-a
  tags = ["bastion"]
  boot_disk {
    auto_delete = true
    device_name = "vmdisk"
    mode = "READ_WRITE"
    source = null
  }
  network_interface {
    network = "myVmNet"
    subnetwork = "subnet1"
    network_ip = null
    access_config {
      nat_ip = ""
      public_ptr_domain_name = ""
      network_tier = ""
    }
    ipv6_access_config {
      public_ptr_domain_name = ""
      network_tier = "STANDARD"
    }
    alias_ip_range {
      public_ptr_domain_name = ""
      network_tier = "STANDARD"
    }
  }
  allow_stopping_for_update = false
  attached_disk {
    source = ""
    device_name = "my-device"

  }
  can_ip_forward = true
  description = "Launch the VM"
  desired_status = "RUNNING"
  deletion_protection = false
  hostname = "compute.example.com"
  guest_accelerator {
    type = null
    count = null
  }
  labels = {
    "key" = "value"
  }
  metadata = {
    "key" = "value"
  }
  metadata_startup_script = null #give/path/to/script
  project = "cs-internal-cust-suc-cloudops"
  scheduling {
    preemptible = false
    on_host_maintenance = "MIGRATE"
    automatic_restart = false
    node_affinities {
      key = "mylable"
      operator = "IN"
      values = [ "" ]
    }
    min_node_cpus = ""
    provisioning_model = "STANDARD"
    instance_termination_action = "STOP"
  }
  scratch_disk {
    interface = "SCSI"
  }
  service_account {
    email = ""
    scope = ""
  }
  shielded_instance_config {
    enable_secure_boot = null
    enable_integrity_monitoring = null
    enable_vtpm = null
  }
  enable_display = true
  resource_policies = ""
  reservation_affinity {
    type = ""
    specific_reservation = [""]
  }

  confidential_instance_config {
    enable_confidential_compute = null
  }

  advanced_machine_features {
    enable_nested_virtualization = false
    threads_per_core = 1
    visible_core_count = null
  }
  
}