variable "os_ver_8" {
  description = "AlmaLinux OS 8 version"

  type    = string
  default = "8.10"

  validation {
    condition     = can(regex("8.[3-9]$|8.[1-9][0-9]$", var.os_ver_8))
    error_message = "The os_ver_8 value must be one of released or prereleased versions of AlmaLinux OS 8."
  }
}

variable "os_ver_9" {
  description = "AlmaLinux OS 9 version"

  type    = string
  default = "9.8"

  validation {
    condition     = can(regex("9.[0-9]$|9.[1-9][0-9]$", var.os_ver_9))
    error_message = "The os_ver_9 value must be one of released or prereleased versions of AlmaLinux OS 9."
  }
}

variable "os_ver_10" {
  description = "AlmaLinux OS 10 version"

  type    = string
  default = "10.2"

  validation {
    condition     = can(regex("10.[0-9]$|10.[1-9][0-9]$", var.os_ver_10))
    error_message = "The os_ver_10 value must be one of released or prereleased versions of AlmaLinux OS 10."
  }
}

# Rocky Linux versions

variable "os_ver_rocky_8" {
  description = "Rocky Linux 8 version"

  type    = string
  default = "8.10"

  validation {
    condition     = can(regex("8.[3-9]$|8.[1-9][0-9]$", var.os_ver_rocky_8))
    error_message = "The os_ver_rocky_8 value must be one of released or prereleased versions of Rocky Linux 8."
  }
}

variable "os_ver_rocky_9" {
  description = "Rocky Linux 9 version"

  type    = string
  default = "9.8"

  validation {
    condition     = can(regex("9.[0-9]$|9.[1-9][0-9]$", var.os_ver_rocky_9))
    error_message = "The os_ver_rocky_9 value must be one of released or prereleased versions of Rocky Linux 9."
  }
}

variable "os_ver_rocky_10" {
  description = "Rocky Linux 10 version"

  type    = string
  default = "10.1"

  validation {
    condition     = can(regex("10.[0-9]$|10.[1-9][0-9]$", var.os_ver_rocky_10))
    error_message = "The os_ver_rocky_10 value must be one of released or prereleased versions of Rocky Linux 10."
  }
}

# CentOS Stream versions

variable "os_ver_centos_stream_9" {
  description = "CentOS Stream 9 version"

  type    = string
  default = "9"
}

variable "os_ver_centos_stream_10" {
  description = "CentOS Stream 10 version"

  type    = string
  default = "10"
}

# Fedora versions

variable "os_ver_fedora_43" {
  description = "Fedora 43 version"

  type    = string
  default = "43"
}

variable "os_ver_fedora_44" {
  description = "Fedora 44 version"

  type    = string
  default = "44"
}

variable "fedora_point_release_43" {
  description = "Fedora 43 point release (e.g. 1.6)"

  type    = string
  default = "1.6"
}

variable "fedora_point_release_44" {
  description = "Fedora 44 point release (e.g. 1.7)"

  type    = string
  default = "1.7"
}

locals {
  os_ver_minor_8 = split(".", var.os_ver_8)[1]
}

locals {
  iso_url_8_x86_64        = "https://repo.almalinux.org/almalinux/${var.os_ver_8}/isos/x86_64/AlmaLinux-${var.os_ver_8}-x86_64-boot.iso"
  iso_checksum_8_x86_64   = "file:https://repo.almalinux.org/almalinux/${var.os_ver_8}/isos/x86_64/CHECKSUM"
  iso_url_8_aarch64       = "https://repo.almalinux.org/almalinux/${var.os_ver_8}/isos/aarch64/AlmaLinux-${var.os_ver_8}-aarch64-boot.iso"
  iso_checksum_8_aarch64  = "file:https://repo.almalinux.org/almalinux/${var.os_ver_8}/isos/aarch64/CHECKSUM"
  iso_url_9_x86_64        = "https://repo.almalinux.org/almalinux/${var.os_ver_9}/isos/x86_64/AlmaLinux-${var.os_ver_9}-x86_64-boot.iso"
  iso_checksum_9_x86_64   = "file:https://repo.almalinux.org/almalinux/${var.os_ver_9}/isos/x86_64/CHECKSUM"
  iso_url_9_aarch64       = "https://repo.almalinux.org/almalinux/${var.os_ver_9}/isos/aarch64/AlmaLinux-${var.os_ver_9}-aarch64-boot.iso"
  iso_checksum_9_aarch64  = "file:https://repo.almalinux.org/almalinux/${var.os_ver_9}/isos/aarch64/CHECKSUM"
  iso_url_10_x86_64       = "https://repo.almalinux.org/almalinux/${var.os_ver_10}/isos/x86_64/AlmaLinux-${var.os_ver_10}-x86_64-boot.iso"
  iso_checksum_10_x86_64  = "file:https://repo.almalinux.org/almalinux/${var.os_ver_10}/isos/x86_64/CHECKSUM"
  iso_url_10_aarch64      = "https://repo.almalinux.org/almalinux/${var.os_ver_10}/isos/aarch64/AlmaLinux-${var.os_ver_10}-aarch64-boot.iso"
  iso_checksum_10_aarch64 = "file:https://repo.almalinux.org/almalinux/${var.os_ver_10}/isos/aarch64/CHECKSUM"

  # Rocky Linux ISO URLs (directory uses major version only, filename uses full version)
  iso_url_rocky_8_x86_64        = "https://dl.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-${var.os_ver_rocky_8}-x86_64-boot.iso"
  iso_checksum_rocky_8_x86_64   = "file:https://dl.rockylinux.org/pub/rocky/8/isos/x86_64/CHECKSUM"
  iso_url_rocky_8_aarch64       = "https://dl.rockylinux.org/pub/rocky/8/isos/aarch64/Rocky-${var.os_ver_rocky_8}-aarch64-boot.iso"
  iso_checksum_rocky_8_aarch64  = "file:https://dl.rockylinux.org/pub/rocky/8/isos/aarch64/CHECKSUM"
  iso_url_rocky_9_x86_64        = "https://dl.rockylinux.org/pub/rocky/9/isos/x86_64/Rocky-${var.os_ver_rocky_9}-x86_64-boot.iso"
  iso_checksum_rocky_9_x86_64   = "file:https://dl.rockylinux.org/pub/rocky/9/isos/x86_64/CHECKSUM"
  iso_url_rocky_9_aarch64       = "https://dl.rockylinux.org/pub/rocky/9/isos/aarch64/Rocky-${var.os_ver_rocky_9}-aarch64-boot.iso"
  iso_checksum_rocky_9_aarch64  = "file:https://dl.rockylinux.org/pub/rocky/9/isos/aarch64/CHECKSUM"
  iso_url_rocky_10_x86_64       = "https://dl.rockylinux.org/pub/rocky/10/isos/x86_64/Rocky-${var.os_ver_rocky_10}-x86_64-boot.iso"
  iso_checksum_rocky_10_x86_64  = "file:https://dl.rockylinux.org/pub/rocky/10/isos/x86_64/CHECKSUM"
  iso_url_rocky_10_aarch64      = "https://dl.rockylinux.org/pub/rocky/10/isos/aarch64/Rocky-${var.os_ver_rocky_10}-aarch64-boot.iso"
  iso_checksum_rocky_10_aarch64 = "file:https://dl.rockylinux.org/pub/rocky/10/isos/aarch64/CHECKSUM"

  # Rocky Linux 8 minor version
  os_ver_minor_rocky_8 = split(".", var.os_ver_rocky_8)[1]

  # CentOS Stream ISO URLs (checksums parsed dynamically from SHA256SUM via data "http")
  iso_url_centos_stream_9_x86_64       = "https://mirror.stream.centos.org/9-stream/BaseOS/x86_64/iso/CentOS-Stream-9-latest-x86_64-boot.iso"
  iso_checksum_centos_stream_9_x86_64  = "sha256:${regex("(?m)^SHA256 \\(CentOS-Stream-9-[^)]+-x86_64-boot\\.iso\\) = ([0-9a-f]{64})", data.http.centos_stream_9_x86_64.body)[0]}"
  iso_url_centos_stream_9_aarch64      = "https://mirror.stream.centos.org/9-stream/BaseOS/aarch64/iso/CentOS-Stream-9-latest-aarch64-boot.iso"
  iso_checksum_centos_stream_9_aarch64 = "sha256:${regex("(?m)^SHA256 \\(CentOS-Stream-9-[^)]+-aarch64-boot\\.iso\\) = ([0-9a-f]{64})", data.http.centos_stream_9_aarch64.body)[0]}"

  iso_url_centos_stream_10_x86_64       = "https://mirror.stream.centos.org/10-stream/BaseOS/x86_64/iso/CentOS-Stream-10-latest-x86_64-boot.iso"
  iso_checksum_centos_stream_10_x86_64  = "sha256:${regex("(?m)^SHA256 \\(CentOS-Stream-10-[^)]+-x86_64-boot\\.iso\\) = ([0-9a-f]{64})", data.http.centos_stream_10_x86_64.body)[0]}"
  iso_url_centos_stream_10_aarch64      = "https://mirror.stream.centos.org/10-stream/BaseOS/aarch64/iso/CentOS-Stream-10-latest-aarch64-boot.iso"
  iso_checksum_centos_stream_10_aarch64 = "sha256:${regex("(?m)^SHA256 \\(CentOS-Stream-10-[^)]+-aarch64-boot\\.iso\\) = ([0-9a-f]{64})", data.http.centos_stream_10_aarch64.body)[0]}"

  # Fedora ISO URLs (checksums parsed dynamically from CHECKSUM file via data "http")
  iso_url_fedora_43_x86_64       = "https://dl.fedoraproject.org/pub/fedora/linux/releases/43/Server/x86_64/iso/Fedora-Server-netinst-x86_64-43-${var.fedora_point_release_43}.iso"
  iso_checksum_fedora_43_x86_64  = "sha256:${regex("(?m)^SHA256 \\(Fedora-Server-netinst-x86_64-43-[^)]+\\.iso\\) = ([0-9a-f]{64})", data.http.fedora_43_x86_64.body)[0]}"
  iso_url_fedora_43_aarch64      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/43/Server/aarch64/iso/Fedora-Server-netinst-aarch64-43-${var.fedora_point_release_43}.iso"
  iso_checksum_fedora_43_aarch64 = "sha256:${regex("(?m)^SHA256 \\(Fedora-Server-netinst-aarch64-43-[^)]+\\.iso\\) = ([0-9a-f]{64})", data.http.fedora_43_aarch64.body)[0]}"

  iso_url_fedora_44_x86_64       = "https://dl.fedoraproject.org/pub/fedora/linux/releases/44/Server/x86_64/iso/Fedora-Server-netinst-x86_64-44-${var.fedora_point_release_44}.iso"
  iso_checksum_fedora_44_x86_64  = "sha256:${regex("(?m)^SHA256 \\(Fedora-Server-netinst-x86_64-44-[^)]+\\.iso\\) = ([0-9a-f]{64})", data.http.fedora_44_x86_64.body)[0]}"
  iso_url_fedora_44_aarch64      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/44/Server/aarch64/iso/Fedora-Server-netinst-aarch64-44-${var.fedora_point_release_44}.iso"
  iso_checksum_fedora_44_aarch64 = "sha256:${regex("(?m)^SHA256 \\(Fedora-Server-netinst-aarch64-44-[^)]+\\.iso\\) = ([0-9a-f]{64})", data.http.fedora_44_aarch64.body)[0]}"
}

# Dynamic checksum fetching — data sources evaluated before locals, so locals can reference .body

data "http" "centos_stream_9_x86_64" {
  url = "https://mirror.stream.centos.org/9-stream/BaseOS/x86_64/iso/SHA256SUM"
}

data "http" "centos_stream_9_aarch64" {
  url = "https://mirror.stream.centos.org/9-stream/BaseOS/aarch64/iso/SHA256SUM"
}

data "http" "centos_stream_10_x86_64" {
  url = "https://mirror.stream.centos.org/10-stream/BaseOS/x86_64/iso/SHA256SUM"
}

data "http" "centos_stream_10_aarch64" {
  url = "https://mirror.stream.centos.org/10-stream/BaseOS/aarch64/iso/SHA256SUM"
}

data "http" "fedora_43_x86_64" {
  url = "https://dl.fedoraproject.org/pub/fedora/linux/releases/43/Server/x86_64/iso/Fedora-Server-43-${var.fedora_point_release_43}-x86_64-CHECKSUM"
}

data "http" "fedora_43_aarch64" {
  url = "https://dl.fedoraproject.org/pub/fedora/linux/releases/43/Server/aarch64/iso/Fedora-Server-43-${var.fedora_point_release_43}-aarch64-CHECKSUM"
}

data "http" "fedora_44_x86_64" {
  url = "https://dl.fedoraproject.org/pub/fedora/linux/releases/44/Server/x86_64/iso/Fedora-Server-44-${var.fedora_point_release_44}-x86_64-CHECKSUM"
}

data "http" "fedora_44_aarch64" {
  url = "https://dl.fedoraproject.org/pub/fedora/linux/releases/44/Server/aarch64/iso/Fedora-Server-44-${var.fedora_point_release_44}-aarch64-CHECKSUM"
}

variable "iso_url_kitten_10_x86_64" {
  description = "The latest AlmaLinux OS Kitten 10 x86_64 ISO"

  type    = string
  default = "https://kitten.repo.almalinux.org/10-kitten/isos/x86_64/AlmaLinux-Kitten-10-latest-x86_64-boot.iso"
}

variable "iso_checksum_kitten_10_x86_64" {
  description = "The checksum of latest AlmaLinux OS Kitten 10 x86_64 ISO"

  type    = string
  default = "file:https://kitten.repo.almalinux.org/10-kitten/isos/x86_64/CHECKSUM"
}

variable "iso_url_kitten_10_aarch64" {
  description = "The latest AlmaLinux OS Kitten 10 AArch64 ISO"

  type    = string
  default = "https://kitten.repo.almalinux.org/10-kitten/isos/aarch64/AlmaLinux-Kitten-10-latest-aarch64-boot.iso"
}

variable "iso_checksum_kitten_10_aarch64" {
  description = "The checksum of latest AlmaLinux OS Kitten 10 AArch64 ISO"

  type    = string
  default = "file:https://kitten.repo.almalinux.org/10-kitten/isos/aarch64/CHECKSUM"
}

# Common

variable "headless" {
  description = "Disable GUI"

  type    = bool
  default = true
}

variable "boot_wait" {
  description = "Time to wait before typing boot command"

  type    = string
  default = "10s"
}

variable "cpus" {
  description = "The number of virtual cpus"

  type    = number
  default = 4
}

variable "memory_x86_64" {
  description = "The amount of memory to use when building the x86_64 VM in megabytes"

  type    = number
  default = 3072
}

variable "memory_aarch64" {
  description = "The amount of memory to use when building the AArch64 VM in megabytes"

  type    = number
  default = 4096
}

variable "http_directory" {
  description = "Path to a directory to serve kickstart files"

  type    = string
  default = "http"
}

variable "ssh_timeout" {
  description = "The time to wait for SSH to become available"

  type    = string
  default = "3600s"
}

variable "root_shutdown_command" {
  description = "The command to use to gracefully shut down the machine"

  type    = string
  default = "/sbin/shutdown -hP now"
}

variable "qemu_binary" {
  description = "Path of QEMU binary"

  type    = string
  default = null
}

variable "ovmf_code" {
  description = "Path of OVMF code file"

  type    = string
  default = "/usr/share/OVMF/OVMF_CODE_4M.secboot.fd"
}

variable "ovmf_vars" {
  description = "Path of OVMF variables file"

  type    = string
  default = "/usr/share/OVMF/OVMF_VARS_4M.fd"
}

variable "aavmf_code" {
  description = "Path of AAVMF code file"

  type    = string
  default = "/usr/share/AAVMF/AAVMF_CODE.fd"
}

# Generic Cloud (Cloud-init)

variable "gencloud_disk_size" {
  description = "The size in GB of hard disk of VM"

  type    = string
  default = "5G"
}

variable "gencloud_ssh_username" {
  description = "The username to connect to SSH with"

  type    = string
  default = "root"
}

variable "gencloud_ssh_password" {
  description = "A plaintext password to use to authenticate with SSH"

  type    = string
  default = "packer"
}

local "gencloud_boot_command_8_x86_64" {
  expression = [
    "c<wait>",
    "linuxefi",
    " /images/pxeboot/vmlinuz",
    " inst.stage2=hd:LABEL=AlmaLinux-8-${local.os_ver_minor_8}-x86_64-dvd ro",
    " inst.text biosdevname=0 net.ifnames=0",
    " inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-8.gencloud-x86_64.ks",
    "<enter>",
    "initrdefi /images/pxeboot/initrd.img",
    "<enter>",
    "boot<enter><wait>",
  ]
}

local "gencloud_boot_command_8_aarch64" {
  expression = [
    "c<wait>",
    "linux /images/pxeboot/vmlinuz",
    " inst.stage2=hd:LABEL=AlmaLinux-8-${local.os_ver_minor_8}-aarch64-dvd ro",
    " inst.text biosdevname=0 net.ifnames=0",
    " inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-8.gencloud-aarch64.ks",
    "<enter>",
    "initrd /images/pxeboot/initrd.img",
    "<enter>",
    "boot<enter><wait>",
  ]
}

variable "gencloud_boot_command_9_x86_64" {
  description = "Boot command for AlmaLinux OS 9 Generic Cloud x86_64"

  type = list(string)
  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-9.gencloud-x86_64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

variable "gencloud_boot_command_9_aarch64" {
  description = "Boot command for AlmaLinux OS 9 Generic Cloud AArch64"

  type = list(string)

  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-9.gencloud-aarch64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

variable "gencloud_boot_command_kitten_10_x86_64" {
  description = "Boot command for AlmaLinux OS Kitten 10 Generic Cloud x86_64"

  type = list(string)
  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-kitten-10.gencloud-x86_64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

variable "gencloud_boot_command_kitten_10_aarch64" {
  description = "Boot command for AlmaLinux OS Kitten 10 Generic Cloud AArch64"

  type = list(string)

  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-kitten-10.gencloud-aarch64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

variable "gencloud_boot_command_10_x86_64" {
  description = "Boot command for AlmaLinux OS 10 Generic Cloud x86_64"

  type = list(string)
  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-10.gencloud-x86_64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

variable "gencloud_boot_command_10_aarch64" {
  description = "Boot command for AlmaLinux OS 10 Generic Cloud AArch64"

  type = list(string)

  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-10.gencloud-aarch64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

# Rocky Linux boot commands

local "gencloud_boot_command_rocky_8_x86_64" {
  expression = [
    "c<wait>",
    "linuxefi",
    " /images/pxeboot/vmlinuz",
    " inst.stage2=hd:LABEL=Rocky-8-${local.os_ver_minor_rocky_8}-x86_64-dvd ro",
    " inst.text biosdevname=0 net.ifnames=0",
    " inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/rockylinux-8.gencloud-x86_64.ks",
    "<enter>",
    "initrdefi /images/pxeboot/initrd.img",
    "<enter>",
    "boot<enter><wait>",
  ]
}

local "gencloud_boot_command_rocky_8_aarch64" {
  expression = [
    "c<wait>",
    "linux /images/pxeboot/vmlinuz",
    " inst.stage2=hd:LABEL=Rocky-8-${local.os_ver_minor_rocky_8}-aarch64-dvd ro",
    " inst.text biosdevname=0 net.ifnames=0",
    " inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/rockylinux-8.gencloud-aarch64.ks",
    "<enter>",
    "initrd /images/pxeboot/initrd.img",
    "<enter>",
    "boot<enter><wait>",
  ]
}

variable "gencloud_boot_command_rocky_9_x86_64" {
  description = "Boot command for Rocky Linux 9 Generic Cloud x86_64"

  type = list(string)
  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/rockylinux-9.gencloud-x86_64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

variable "gencloud_boot_command_rocky_9_aarch64" {
  description = "Boot command for Rocky Linux 9 Generic Cloud AArch64"

  type = list(string)

  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/rockylinux-9.gencloud-aarch64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

variable "gencloud_boot_command_rocky_10_x86_64" {
  description = "Boot command for Rocky Linux 10 Generic Cloud x86_64"

  type = list(string)
  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/rockylinux-10.gencloud-x86_64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

variable "gencloud_boot_command_rocky_10_aarch64" {
  description = "Boot command for Rocky Linux 10 Generic Cloud AArch64"

  type = list(string)

  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/rockylinux-10.gencloud-aarch64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

# CentOS Stream 9 boot commands

variable "gencloud_boot_command_centos_stream_9_x86_64" {
  description = "Boot command for CentOS Stream 9 Generic Cloud x86_64"

  type = list(string)
  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/centos-stream-9.gencloud-x86_64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

variable "gencloud_boot_command_centos_stream_9_aarch64" {
  description = "Boot command for CentOS Stream 9 Generic Cloud AArch64"

  type = list(string)

  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/centos-stream-9.gencloud-aarch64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

# CentOS Stream 10 boot commands

variable "gencloud_boot_command_centos_stream_10_x86_64" {
  description = "Boot command for CentOS Stream 10 Generic Cloud x86_64"

  type = list(string)
  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/centos-stream-10.gencloud-x86_64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

variable "gencloud_boot_command_centos_stream_10_aarch64" {
  description = "Boot command for CentOS Stream 10 Generic Cloud AArch64"

  type = list(string)

  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/centos-stream-10.gencloud-aarch64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

# Fedora 43 boot commands

variable "gencloud_boot_command_fedora_43_x86_64" {
  description = "Boot command for Fedora 43 Generic Cloud x86_64"

  type = list(string)
  default = [
    "<wait30s>",
    "c<wait>",
    "linux /images/pxeboot/vmlinuz biosdevname=0 net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/fedora-43.gencloud-x86_64.ks<enter><wait>",
    "initrd /images/pxeboot/initrd.img<enter><wait>",
    "boot<enter>",
  ]
}

variable "gencloud_boot_command_fedora_43_aarch64" {
  description = "Boot command for Fedora 43 Generic Cloud AArch64"

  type = list(string)
  default = [
    "<wait30s>",
    "c<wait>",
    "linux /images/pxeboot/vmlinuz biosdevname=0 net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/fedora-43.gencloud-aarch64.ks<enter><wait>",
    "initrd /images/pxeboot/initrd.img<enter><wait>",
    "boot<enter>",
  ]
}

# Fedora 44 boot commands

variable "gencloud_boot_command_fedora_44_x86_64" {
  description = "Boot command for Fedora 44 Generic Cloud x86_64"

  type = list(string)
  default = [
    "<wait30s>",
    "c<wait>",
    "linux /images/pxeboot/vmlinuz biosdevname=0 net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/fedora-44.gencloud-x86_64.ks<enter><wait>",
    "initrd /images/pxeboot/initrd.img<enter><wait>",
    "boot<enter>",
  ]
}

variable "gencloud_boot_command_fedora_44_aarch64" {
  description = "Boot command for Fedora 44 Generic Cloud AArch64"

  type = list(string)
  default = [
    "<wait30s>",
    "c<wait>",
    "linux /images/pxeboot/vmlinuz biosdevname=0 net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/fedora-44.gencloud-aarch64.ks<enter><wait>",
    "initrd /images/pxeboot/initrd.img<enter><wait>",
    "boot<enter>",
  ]
}

# Debian/Ubuntu versions

variable "os_ver_debian_11" {
  description = "Debian 11 version"

  type    = string
  default = "11.11.0"
}

variable "os_ver_debian_12" {
  description = "Debian 12 version"

  type    = string
  default = "12.14.0"
}

variable "os_ver_debian_13" {
  description = "Debian 13 version"

  type    = string
  default = "13.5.0"
}

variable "os_ver_ubuntu_2204" {
  description = "Ubuntu 22.04 version"

  type    = string
  default = "22.04.5"
}

variable "os_ver_ubuntu_2404" {
  description = "Ubuntu 24.04 version"

  type    = string
  default = "24.04.4"
}

variable "os_ver_ubuntu_2604" {
  description = "Ubuntu 26.04 version"

  type    = string
  default = "26.04"
}

# Debian installation ISO URLs and checksums
# Architecture mapping: Packer uses x86_64/aarch64, Debian ISOs use amd64/arm64

locals {
  debian_11_iso_url_x86_64       = "https://cdimage.debian.org/cdimage/archive/${var.os_ver_debian_11}/amd64/iso-cd/debian-${var.os_ver_debian_11}-amd64-netinst.iso"
  debian_11_iso_checksum_x86_64  = "file:https://cdimage.debian.org/cdimage/archive/${var.os_ver_debian_11}/amd64/iso-cd/SHA512SUMS"
  debian_11_iso_url_aarch64      = "https://cdimage.debian.org/cdimage/archive/${var.os_ver_debian_11}/arm64/iso-cd/debian-${var.os_ver_debian_11}-arm64-netinst.iso"
  debian_11_iso_checksum_aarch64 = "file:https://cdimage.debian.org/cdimage/archive/${var.os_ver_debian_11}/arm64/iso-cd/SHA512SUMS"

  debian_12_iso_url_x86_64       = "https://cdimage.debian.org/cdimage/archive/${var.os_ver_debian_12}/amd64/iso-cd/debian-${var.os_ver_debian_12}-amd64-netinst.iso"
  debian_12_iso_checksum_x86_64  = "file:https://cdimage.debian.org/cdimage/archive/${var.os_ver_debian_12}/amd64/iso-cd/SHA512SUMS"
  debian_12_iso_url_aarch64      = "https://cdimage.debian.org/cdimage/archive/${var.os_ver_debian_12}/arm64/iso-cd/debian-${var.os_ver_debian_12}-arm64-netinst.iso"
  debian_12_iso_checksum_aarch64 = "file:https://cdimage.debian.org/cdimage/archive/${var.os_ver_debian_12}/arm64/iso-cd/SHA512SUMS"

  debian_13_iso_url_x86_64       = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-${var.os_ver_debian_13}-amd64-netinst.iso"
  debian_13_iso_checksum_x86_64  = "file:https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/SHA512SUMS"
  debian_13_iso_url_aarch64      = "https://cdimage.debian.org/cdimage/release/current/arm64/iso-cd/debian-${var.os_ver_debian_13}-arm64-netinst.iso"
  debian_13_iso_checksum_aarch64 = "file:https://cdimage.debian.org/cdimage/release/current/arm64/iso-cd/SHA512SUMS"
}

# Ubuntu installation ISO URLs and checksums
# Codenames: jammy (22.04), noble (24.04), resolute (26.04)
# amd64 ISOs on releases.ubuntu.com, arm64 ISOs on cdimage.ubuntu.com

locals {
  ubuntu_2204_iso_url_x86_64       = "https://releases.ubuntu.com/22.04/ubuntu-${var.os_ver_ubuntu_2204}-live-server-amd64.iso"
  ubuntu_2204_iso_checksum_x86_64  = "file:https://releases.ubuntu.com/22.04/SHA256SUMS"
  ubuntu_2204_iso_url_aarch64      = "https://cdimage.ubuntu.com/releases/22.04/release/ubuntu-${var.os_ver_ubuntu_2204}-live-server-arm64.iso"
  ubuntu_2204_iso_checksum_aarch64 = "file:https://cdimage.ubuntu.com/releases/22.04/release/SHA256SUMS"

  ubuntu_2404_iso_url_x86_64       = "https://releases.ubuntu.com/24.04/ubuntu-${var.os_ver_ubuntu_2404}-live-server-amd64.iso"
  ubuntu_2404_iso_checksum_x86_64  = "file:https://releases.ubuntu.com/24.04/SHA256SUMS"
  ubuntu_2404_iso_url_aarch64      = "https://cdimage.ubuntu.com/releases/24.04/release/ubuntu-${var.os_ver_ubuntu_2404}-live-server-arm64.iso"
  ubuntu_2404_iso_checksum_aarch64 = "file:https://cdimage.ubuntu.com/releases/24.04/release/SHA256SUMS"

  ubuntu_2604_iso_url_x86_64       = "https://releases.ubuntu.com/26.04/ubuntu-${var.os_ver_ubuntu_2604}-live-server-amd64.iso"
  ubuntu_2604_iso_checksum_x86_64  = "file:https://releases.ubuntu.com/26.04/SHA256SUMS"
  ubuntu_2604_iso_url_aarch64      = "https://cdimage.ubuntu.com/releases/26.04/release/ubuntu-${var.os_ver_ubuntu_2604}-live-server-arm64.iso"
  ubuntu_2604_iso_checksum_aarch64 = "file:https://cdimage.ubuntu.com/releases/26.04/release/SHA256SUMS"
}

# Debian boot commands (GRUB shell: auto=true with preseed URL)

local "gencloud_boot_command_debian_11_x86_64" {
  expression = [
    "<wait30s>",
    "c<wait>",
    "linux /install.amd/vmlinuz auto=true priority=critical preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian-11.gencloud-x86_64.cfg debian-installer/locale=en_US.UTF-8 keyboard-configuration/xkb-keymap=us<enter><wait>",
    "initrd /install.amd/initrd.gz<enter><wait>",
    "boot<enter>",
  ]
}

local "gencloud_boot_command_debian_11_aarch64" {
  expression = [
    "<wait30s>",
    "c<wait>",
    "linux /install.a64/vmlinuz auto=true priority=critical preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian-11.gencloud-aarch64.cfg debian-installer/locale=en_US.UTF-8 keyboard-configuration/xkb-keymap=us<enter><wait>",
    "initrd /install.a64/initrd.gz<enter><wait>",
    "boot<enter>",
  ]
}

local "gencloud_boot_command_debian_12_x86_64" {
  expression = [
    "<wait30s>",
    "c<wait>",
    "linux /install.amd/vmlinuz auto=true priority=critical preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian-12.gencloud-x86_64.cfg debian-installer/locale=en_US.UTF-8 keyboard-configuration/xkb-keymap=us<enter><wait>",
    "initrd /install.amd/initrd.gz<enter><wait>",
    "boot<enter>",
  ]
}

local "gencloud_boot_command_debian_12_aarch64" {
  expression = [
    "<wait30s>",
    "c<wait>",
    "linux /install.a64/vmlinuz auto=true priority=critical preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian-12.gencloud-aarch64.cfg debian-installer/locale=en_US.UTF-8 keyboard-configuration/xkb-keymap=us<enter><wait>",
    "initrd /install.a64/initrd.gz<enter><wait>",
    "boot<enter>",
  ]
}

local "gencloud_boot_command_debian_13_x86_64" {
  expression = [
    "<wait30s>",
    "c<wait>",
    "linux /install.amd/vmlinuz auto=true priority=critical preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian-13.gencloud-x86_64.cfg debian-installer/locale=en_US.UTF-8 keyboard-configuration/xkb-keymap=us<enter><wait>",
    "initrd /install.amd/initrd.gz<enter><wait>",
    "boot<enter>",
  ]
}

local "gencloud_boot_command_debian_13_aarch64" {
  expression = [
    "<wait30s>",
    "c<wait>",
    "linux /install.a64/vmlinuz auto=true priority=critical preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian-13.gencloud-aarch64.cfg debian-installer/locale=en_US.UTF-8 keyboard-configuration/xkb-keymap=us<enter><wait>",
    "initrd /install.a64/initrd.gz<enter><wait>",
    "boot<enter>",
  ]
}

# Ubuntu boot commands (GRUB command line mode: autoinstall with ds=nocloud-net)

local "gencloud_boot_command_ubuntu_2204_x86_64" {
  expression = [
    "<wait25s>",
    "c<wait>",
    "linux /casper/vmlinuz autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu-22.04.gencloud-x86_64/<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter>",
  ]
}

local "gencloud_boot_command_ubuntu_2204_aarch64" {
  expression = [
    "<wait25s>",
    "c<wait>",
    "linux /casper/vmlinuz autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu-22.04.gencloud-aarch64/<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter>",
  ]
}

local "gencloud_boot_command_ubuntu_2404_x86_64" {
  expression = [
    "<wait25s>",
    "c<wait>",
    "linux /casper/vmlinuz autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu-24.04.gencloud-x86_64/<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter>",
  ]
}

local "gencloud_boot_command_ubuntu_2404_aarch64" {
  expression = [
    "<wait25s>",
    "c<wait>",
    "linux /casper/vmlinuz autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu-24.04.gencloud-aarch64/<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter>",
  ]
}

local "gencloud_boot_command_ubuntu_2604_x86_64" {
  expression = [
    "<wait25s>",
    "c<wait>",
    "linux /casper/vmlinuz autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu-26.04.gencloud-x86_64/<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter>",
  ]
}

local "gencloud_boot_command_ubuntu_2604_aarch64" {
  expression = [
    "<wait25s>",
    "c<wait>",
    "linux /casper/vmlinuz autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu-26.04.gencloud-aarch64/<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter>",
  ]
}

