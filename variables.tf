variable "vdc_org_name" {}
variable "vdc_name" {
  
}

variable "vapp_networks" {
  description = "List of vApp networks to be created"
  type        = map(object({
    vapp_name             = string
    org_network_name      = string
    is_fenced             = bool
    retain_ip_mac_enabled = bool
    reboot_vapp_on_removal = bool
  }))
}
