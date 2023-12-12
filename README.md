## VCD vApp Organization Network Terraform Module

This Terraform module will attach an existing Org VDC Network to a Virtual Application (vApp) in a VMware Cloud Director (VCD) environment. This module can be used to attach Org Networks to a vApp in [Rackspace Technology SDDC Flex](https://www.rackspace.com/cloud/private/software-defined-data-center-flex) VCD Data Center Regions.

### Requirements

| Name      | Version |
|-----------|---------|
| terraform | ~> 1.2  |
| vcd       | ~> 3.8 |

### Resources

| Name                                                         | Type         |
|--------------------------------------------------------------|--------------|
| [vcd_vapp_org_network](https://registry.terraform.io/providers/vmware/vcd/latest/docs/resources/vapp_org_network) | Resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| vdc_org_name | The name of the Data Center Group Organization in VCD | string | Organization Name Format: `"Organization Name Format: <Account_Number>-<Region>-<Account_Name>"` | yes |
| vapp_networks | List of vApp Organization Networks to be created | map(object) | - | yes |

### Outputs

| Name                      | Description                                   |
|---------------------------|-----------------------------------------------|
| vapp_network_ids          | The IDs of the created vApp networks          |
| vapp_names                | The names of the vApps for the created vApp networks |
| vapp_org_network_names    | The org network names for the created vApp networks |

### Example Usage

This is an example of a `main.tf` file that uses the `"github.com/global-vmware/vcd_vapp_org_network"` Module source to attach Org Networks to a vApp in a VMware Cloud Director environment:

```terraform
module "vapp_networks" {
  source                        = "github.com/global-vmware/vcd_vapp_org_network.git?ref=v1.0.1"

  vdc_org_name                  = "<US1-VDC-ORG-NAME>"
  vdc_name                      = "<US1-VDC-NAME>"
  
  vapp_networks = {
    "US1-Segment-01" = {
      vapp_name                 = "Production Application 01"
      org_network_name          = "US1-Segment-01"
      is_fenced                 = true
      retain_ip_mac_enabled     = false
      reboot_vapp_on_removal    = true
    },
    "US1-Segment-02" = {
      vapp_name                 = "Production Application 02"
      org_network_name          = "US1-Segment-02"
      is_fenced                 = false
      retain_ip_mac_enabled     = true
      reboot_vapp_on_removal    = false
    }
  }
}
```

## Authors

This module is maintained by the [Global VMware Cloud Automation Services Team](https://github.com/global-vmware).