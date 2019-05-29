# providers info
provider "google" {
  // please provide your credentials as an sa.json file
  credentials = "${file("projetcicd-afb8e69b7ae7.json")}"
  project     = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}
