# Variable to be defined


variable "vmName" {
  description = "Name of the VM"
  default = "myVM"
  type = string
}

variable "Region" {
  description = "Region in which we have to host the VM"
  default = "us-central1"
  type = string
}

variable "zone" {
  description = "Zone which you want to host"
  default = "${var.Rregion}-a"
  type = string
}

variable "machineConfigSeries" {
  description = "Series of CPU PLATFORM"
}