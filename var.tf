variable "vmname" {
  type        = list(string)
  description = "The name of the virtual machine"
  default     = ["sycor1", "sycor2"]
}

variable "vmnic" {
  type        = list(string)
  description = "The nics of vms"
  default     = ["sycor-nic", "sycor-nic2"]

}

variable "image_publisher" {
  type        = string
  description = "Azure image publisher"
  default     = "MicrosoftWindowsServer"
}
variable "image_offer" {
  type        = string
  description = "Azure image offer"
  default     = "WindowsServer"
}
variable "image_sku" {
  type        = string
  description = "Azure image sku"
  default     = "2016-Datacenter"
}

variable "admin_username" {
  type      = map(string)
  sensitive = true

}

variable "admin_password" {
  type      = map(string)
  sensitive = true
}

