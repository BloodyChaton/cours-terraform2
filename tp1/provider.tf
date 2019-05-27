provider "google" {
  credentials = "${file("coursterraform2-0b47e8d27a62.json")}" 
  project     = "${var.project}"
  region      = "${var.region}"
  zone        = "${var.zone}"
}