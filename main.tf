provider "scaleway" {
  region = "ams1"
}


data "scaleway_image" "wordpress-iot" {
  architecture = "x86_64"
  name         = "Ubuntu Bionic"
}

resource "scaleway_server" "wordpress-iot" {
  name  = "wordpress-iot"
  image = "${data.scaleway_image.wordpress-iot.id}"
  type  = "START1-S"
}

resource "scaleway_ip" "ip" {
  server = "${scaleway_server.wordpress-iot.id}"
}

resource "scaleway_volume" "wordpress-iot" {
  name       = "wordpress-iot"
  size_in_gb = 50
  type       = "l_ssd"
}
