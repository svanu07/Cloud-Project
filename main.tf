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

resource "scaleway_security_group" "http" {
  name        = "http"
  description = "allow HTTP and HTTPS traffic"
}

resource "scaleway_security_group_rule" "http_accept" {
  security_group = "${scaleway_security_group.http.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 80
}

resource "scaleway_security_group_rule" "https_accept" {
  security_group = "${scaleway_security_group.http.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 443
}


