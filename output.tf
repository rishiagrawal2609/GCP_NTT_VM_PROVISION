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



output "InternalIp" {
    value = google_compute_instance.main.network_interface.0.network_ip
}





