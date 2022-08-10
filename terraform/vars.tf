
variable ResourceGroup {
  default     = "lavoro"
}

variable Location {
  default     = "eastus"
}

variable VirtualNetwork {
  default     = "lavoro-net"
}

variable VirtualNetworkIP {
  default     = "10.100.0.0/16"
}

variable VirtualSubnet {
  default     = "lavoro-subnet01"
}

variable VirtualSubnetIP {
  default     = "10.100.100.0/24"
}

variable NetworkInterface {
  default     = "lavoro-NIC"
}

variable PublicIPName {
  default     = "lavoro-publicIP"
}

variable Role {
  type = list(string)
  default = ["automation","jenkins","docker","kubemaster","kubeworker01","kubeworker02"]
}

variable Size {
    type = map
    default = {
        "automation" = "Standard_B1ls"
        "jenkins" = "Standard_B2s"
        "docker" = "Standard_B2s"
        "kubemaster" = "Standard_B2s"
        "kubeworker01" = "Standard_B1ls"
        "kubeworker02" = "Standard_B1ls"
    }
}
