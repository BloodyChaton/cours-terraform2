provider "google" {
  credentials = "${file("tpterraformkube-aecc83bd2499.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_compute_firewall" "default" {
  name    = "firewall"
  network = "${google_compute_network.my-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["8080","22"]
  }
  target_tags = ["ssh"]
}

resource "google_compute_project_metadata_item" "ssh-keys" {
  key   = "ssh-keys"
  value = "${var.ssh_user}:${var.public_key}"
}

resource "google_compute_subnetwork" "admin" {
  name          = "admin-subnetwork"
  ip_cidr_range = "10.5.0.0/24"
  region        = "${var.region}"
  network       = "${google_compute_network.my-network.self_link}"
}

resource "google_compute_subnetwork" "kube" {
  name          = "kube-subnetwork"
  ip_cidr_range = "10.6.0.0/18"
  region        = "${var.region}"
  network       = "${google_compute_network.my-network.self_link}"
  secondary_ip_range {
    range_name    = "secondary-range"
    ip_cidr_range = "10.8.0.0/20"
  }
  secondary_ip_range {
    range_name    = "secondary-range2"
    ip_cidr_range = "10.8.96.0/20"
  }
}

resource "google_compute_network" "my-network" {
  provider = "google"
  name = "kubeproject"
  auto_create_subnetworks = "false"
}


