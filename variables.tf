// Resource Group-테라폼 DevOps Test
variable "resource-group-name" {   
    default = "rg-krc-devops-hklee"
}

variable "resource-group-location" {   
    default = "koreacentral"
}
 
/*
// Virtual Network
variable "virtual_network_name" {   
    default = "vnet-terraform-test-hklee"
}

variable "subnet_name" {   
    default = "subnet-terraform-test-hklee"
}
 
// Load Balancer
variable "lb_name" {   
    default = "lb-terraform-test-hklee"
}

variable "lb_backend_pool_name" {   
    default = "lbbackendpool-terraform-test-hklee"
}

variable "lb_front_ip" {        
    default = "10.99.1.10"
}

// Virtual Machine
variable "vm_cnt" {   
    type = number
    default = 2
}

// test
variable "vm_ip_arr" {   
    type = list
    default = ["10.99.1.101","10.99.1.102"]
}
*/