#####################################################################
##
##      Test of VCD for NZ Cloud
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

# Configure the VMware vCloud Director Provider
provider "vcd" {
  user                 = "rohit"
  password             = "password"
  org                  = "TSTCS1"
  url                  = "https://103.5.83.14/api"
  vdc                  = "TSTCS1-PAYG"
  max_retry_timeout    = "30"
  allow_unverified_ssl = "true"
}

resource "vcd_vapp" "web1" {
  name          = "web1"
}
