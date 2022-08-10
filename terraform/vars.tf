
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


