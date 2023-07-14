output "vapp_network_ids" {
  description = "The IDs of the created vApp networks"
  value       = {for k, v in vcd_vapp_org_network.vappOrgNet : k => v.id}
}

output "vapp_names" {
  description = "The names of the vApps for the created vApp networks"
  value       = {for k, v in var.vapp_networks : k => v.vapp_name}
}

output "vapp_org_network_names" {
  description = "The org network names for the created vApp networks"
  value       = {for k, v in var.vapp_networks : k => v.org_network_name}
}
