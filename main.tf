provider "scaleway" {
  region = "ams1"
}


data "scaleway_image" "wordpress" {
  architecture = "x86_64"
  name         = "Ubuntu Bionic"
}

resource "scaleway_server" "wordpress" {
  name  = "wordpress"
  image = "${data.scaleway_image.wordpress.id}"
  type  = "START1-S"
}

resource "scaleway_ip" "ip" {
  server = "${scaleway_server.wordpress.id}"
}

resource "scaleway_volume" "wordpress" {
  name       = "wordpress"
  size_in_gb = 50
  type       = "l_ssd"
}
