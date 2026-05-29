# Ubuntu 26.04 LTS (Resolute) Packer template for Cloud-init included and OpenStack compatible Generic Cloud images

source "qemu" "ubuntu_26_04_gencloud_x86_64" {
  iso_url            = local.ubuntu_2604_iso_url_x86_64
  iso_checksum       = local.ubuntu_2604_iso_checksum_x86_64
  http_directory     = var.http_directory
  shutdown_command   = var.root_shutdown_command
  ssh_username       = var.gencloud_ssh_username
  ssh_password       = var.gencloud_ssh_password
  ssh_timeout        = var.ssh_timeout
  boot_command       = local.gencloud_boot_command_ubuntu_2604_x86_64
  boot_wait          = var.boot_wait
  accelerator        = "kvm"
  disk_interface     = "virtio-scsi"
  disk_size          = var.gencloud_disk_size
  disk_cache         = "unsafe"
  disk_discard       = "unmap"
  disk_detect_zeroes = "unmap"
  disk_compression   = true
  format             = "qcow2"
  headless           = var.headless
  machine_type       = "q35"
  memory             = var.memory_x86_64
  net_device         = "virtio-net"
  qemu_binary        = var.qemu_binary
  vm_name            = "Ubuntu-26.04-GenericCloud-${formatdate("YYYYMMDD", timestamp())}.x86_64.qcow2"
  cpu_model          = "host"
  cpus               = var.cpus
  efi_boot           = true
  efi_firmware_code  = var.ovmf_code
  efi_firmware_vars  = var.ovmf_vars
  efi_drop_efivars   = true
}

source "qemu" "ubuntu_26_04_gencloud_aarch64" {
  iso_url            = local.ubuntu_2604_iso_url_aarch64
  iso_checksum       = local.ubuntu_2604_iso_checksum_aarch64
  http_directory     = var.http_directory
  shutdown_command   = var.root_shutdown_command
  ssh_username       = var.gencloud_ssh_username
  ssh_password       = var.gencloud_ssh_password
  ssh_timeout        = var.ssh_timeout
  boot_command       = local.gencloud_boot_command_ubuntu_2604_aarch64
  boot_wait          = var.boot_wait
  accelerator        = "kvm"
  firmware           = var.aavmf_code
  use_pflash         = false
  disk_interface     = "virtio-scsi"
  disk_size          = var.gencloud_disk_size
  disk_cache         = "unsafe"
  disk_discard       = "unmap"
  disk_detect_zeroes = "unmap"
  disk_compression   = true
  format             = "qcow2"
  headless           = var.headless
  machine_type       = "virt,gic-version=max"
  memory             = var.memory_aarch64
  net_device         = "virtio-net"
  qemu_binary        = var.qemu_binary
  vm_name            = "Ubuntu-26.04-GenericCloud-${formatdate("YYYYMMDD", timestamp())}.aarch64.qcow2"
  cpu_model          = "host"
  cpus               = var.cpus
  qemuargs = [
    ["-boot", "strict=on"],
    ["-monitor", "none"],
  ]
}

build {
  sources = [
    "source.qemu.ubuntu_26_04_gencloud_x86_64",
    "source.qemu.ubuntu_26_04_gencloud_aarch64",
  ]

  provisioner "ansible" {
    galaxy_file          = "./ansible/requirements.yml"
    galaxy_force_install = true
    collections_path     = "./ansible/collections"
    roles_path           = "./ansible/roles"
    playbook_file        = "./ansible/gencloud.yml"
    ansible_env_vars = [
      "ANSIBLE_PIPELINING=True",
      "ANSIBLE_REMOTE_TEMP=/tmp",
      "ANSIBLE_SSH_TRANSFER_METHOD=scp",
      "ANSIBLE_SCP_EXTRA_ARGS=-O",
      "PATH=/tmp/ansible-venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    ]
  }
}
