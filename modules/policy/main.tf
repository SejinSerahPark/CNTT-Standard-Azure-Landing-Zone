// Azure Policy 정의 및 할당 샘플

// 사용가능 지역 제한 정책
resource "azurerm_policy_definition" "allowed_locations" {
  name         = "allowed-locations"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed Locations"
  description  = "리소스 생성 가능 지역을 제한하는 정책입니다."
  policy_rule  = <<POLICY_RULE
  {
    "if": {
      "field": "location",
      "notIn": ["eastus", "westus", "centralus"]
    },
    "then": {
      "effect": "deny"
    }
  }
  POLICY_RULE
}

// 공용 IP 할당을 금지하는 정책
resource "azurerm_policy_definition" "deny_public_ip" {
  name         = "deny-public-ip"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny Public IP"
  description  = "공용 IP 할당을 금지하는 정책입니다."
  policy_rule  = <<POLICY_RULE
  {
    "if": {
      "field": "Microsoft.Network/publicIPAddresses",
      "exists": "true"
    },
    "then": {
      "effect": "deny"
    }
  }
  POLICY_RULE
}

resource "azurerm_policy_assignment" "deny_public_ip_assignment" {
  name                 = "deny-public-ip-assignment"
  display_name         = "Deny Public IP Assignment"
  policy_definition_id = azurerm_policy_definition.deny_public_ip.id
  scope                = var.var-resource-group-name != "" ? data.azurerm_resource_group.rg.id : null
  location             = var.var-resource-group-location
}

data "azurerm_resource_group" "rg" {
  name = var.var-resource-group-name
}

// 태그 표준화 정책
resource "azurerm_policy_definition" "enforce_tags" {
  name         = "enforce-tags"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Enforce Tags"
  description  = "리소스에 표준 태그를 강제 적용하는 정책입니다."
  policy_rule  = <<POLICY_RULE
  {
    "if": {
      "field": "tags",
      "notContainsKey": "Environment"
    },
    "then": {
      "effect": "append",
      "details": {
        "field": "tags",
        "value": {
          "Environment": "Production"
        }
      }
    }
  }
  POLICY_RULE
}

// VM 크기 제한 정책
resource "azurerm_policy_definition" "allowed_vm_sizes" {
  name         = "allowed-vm-sizes"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed VM Sizes"
  description  = "허용된 VM 크기만 사용할 수 있도록 제한하는 정책입니다."
  policy_rule  = <<POLICY_RULE
  {
    "if": {
      "field": "Microsoft.Compute/virtualMachines/sku.name",
      "notIn": ["Standard_DS1_v2", "Standard_DS2_v2", "Standard_B1s"]
    },
    "then": {
      "effect": "deny"
    }
  }
  POLICY_RULE
}
  

