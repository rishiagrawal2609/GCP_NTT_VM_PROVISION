output "VmId" {
    value = google_compute_instance.main.id
}

output "InstanceId" {
  value = google_compute_instance.main.instance_id
}

output "metadataFingerprint" {
  value = google_compute_instance.main.metadata_fingerprint
}

output "selfLink" {
  value = google_compute_instance.main.self_link
}

output "tagsFingerprint" {
  value = google_compute_instance.main.tags_fingerprint
}

output "labelFingerprint" {
    value = google_compute_instance.main.label_fingerprint
}

output "CPUPlatform" {
  value = google_compute_instance.main.cpu_platform
}

output "ipv6AccessType" {
    value = google_compute_instance.main.ipv6_access_type
}

output "InternalIp" {
    value = google_compute_instance.main.network_interface.0.network_ip
}

output "natIp" {
    value = google_compute_instance.main.network_interface.0.nat_ip
}

output "externalIpv6" {
    value = google_compute_instance.main.0.ipv6_access_config.0.external_ipv6
}

output "VPCNetworkId" {
  value = google_compute_network.main.id
}

output "ipv4Gateway" {
    value = google_compute_network.main.gateway_ipv4
}

output "VpcSelfLink" {
    value = google_compute_network.main.self_link
}