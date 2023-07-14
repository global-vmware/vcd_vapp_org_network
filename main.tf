terraform {
  required_version = "~> 1.2"

  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = "~> 3.8"
    }
  }
}

resource "vcd_vapp_org_network" "vappOrgNet" {
  for_each = var.vapp_networks

  vapp_name           = each.value.vapp_name
  org_network_name    = each.value.org_network_name
  is_fenced           = each.value.is_fenced
  retain_ip_mac_enabled = each.value.retain_ip_mac_enabled
  reboot_vapp_on_removal = each.value.reboot_vapp_on_removal
}
