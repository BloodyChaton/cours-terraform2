resource "google_compute_network" "vpc_network" {
  name = "myterraformnetwork"
  #ipv4_range = "10.0.0.0/27"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "test-subnetwork"
  ip_cidr_range = "10.0.0.0/29"
  region        = "${var.region}"
  network       = "${google_compute_network.vpc_network.self_link}"

}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = "${google_compute_network.vpc_network.name}"
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  target_tags = ["montag"]
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-test"
  machine_type = "f1-micro"
  zone         = "${var.zone}"
  tags         = ["montag"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
    auto_delete=true
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "${google_compute_network.vpc_network.name}"
    subnetwork = "${google_compute_subnetwork.subnetwork.name}"
    access_config = {
        //Ephemeral IP
    }
  }
  metadata {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
}
