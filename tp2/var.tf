variable "project" {
  default = "tpterraformkube"
} 

variable "region" {
  default = "europe-north1"
} 

variable "zone" {
  default = "europe-north1-a"
} 

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCym+NouF8g0DKCnFhRX6qHBVYXyaTyiPZkwL33Hr4GrYFREP4cDeTNnklIeRwXfXdgOjF5QBnMGQIKe6pki/CoulTkElz62rCOKPVmMYuudTEMmBN7eYOihDPP4Q9BrmDTakwwMpTTNxiPwpjPZaeU8UUVwKQWYDngSOX40oLW68A6oe4QGkbi2j9XqF/HbOuq7dwQV49ZPwZXiIiK0W/NZjyd7vBqUZlifwHJoVxOVhi7zjxUlHESg1qGkWWboiBnXi1a3nq/MOHlGxGdVlhQiWS+zefZsm9ZlpTSUNEuJTOaL874HcF9DtFVl3zCKeAhMzLFp5RpOJkr0taWLAgN user01@localhost.localdomain"

}

variable "ssh_user" {
  default = "user01"
}