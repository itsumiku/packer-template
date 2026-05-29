# Cloud Images


This project contains [Packer](https://www.packer.io) templates and tools for
building Generic Cloud (OpenStack compatible) images for AlmaLinux, Rocky Linux,
CentOS Stream, Fedora, Debian, and Ubuntu.

Upstream: https://github.com/AlmaLinux/cloud-images [a79d9d0adc20f0b84853594ae322f65a7415efe2]

## Available Images

| Distro | Architecture | Download URL |
| :---: | :---: | :---: |
| AlmaLinux OS | `x86_64` `AArch64` | https://wiki.almalinux.org/cloud/Generic-cloud.html |
| Rocky Linux | `x86_64` `AArch64` | https://rockylinux.org/cloud-images |
| CentOS Stream | `x86_64` `AArch64` | https://www.centos.org/centos-stream/ |
| Fedora | `x86_64` `AArch64` | https://fedoraproject.org/cloud/download |
| Debian | `x86_64` `AArch64` | https://www.debian.org/distrib/ |
| Ubuntu | `x86_64` `AArch64` | https://ubuntu.com/download/server |


## CI/CD Workflows

This repository includes GitHub Actions workflows that automate building, testing, and publishing GenericCloud images. Each workflow has detailed documentation:

| Documentation | Workflows | Description |
| :--- | :--- | :--- |
| [BUILD_IMAGES.md](BUILD_IMAGES.md) | `gencloud-build.yml`, `shared-steps/action.yml` | Build GenericCloud images using Packer; share a common composite action and a `resolve-image-config.sh` lookup for naming/paths |
| [GENCLOUD_TEST.md](GENCLOUD_TEST.md) | `gencloud-test.yml`, `gencloud-test-steps/action.yml` | Sanity-test a GenericCloud `.qcow2` image directly under QEMU/KVM on the runner with a cloud-init seed ISO, run release/arch/disk/`dnf` assertions over SSH, collect the package list, shut the guest down |


## Usage

Make sure the required Packer plugins are installed and the latest:

```sh
packer init -upgrade .
```


### AlmaLinux OS


#### AlmaLinux OS 8

`x86_64` Unified Boot (BIOS and UEFI):

See: [How to build UEFI and Secure Boot supported Images](https://github.com/AlmaLinux/cloud-images#how-to-build-uefi-and-secure-boot-supported-images)

```sh
packer build -only=qemu.almalinux-8-gencloud-x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.almalinux-8-gencloud-aarch64 .
```

#### AlmaLinux OS 9

`x86_64` Unified Boot (BIOS and UEFI):

```sh
packer build -only=qemu.almalinux-9-gencloud-x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.almalinux-9-gencloud-aarch64 .
```

#### AlmaLinux OS 10

`x86_64` Unified Boot (BIOS and UEFI):

```sh
packer build -only=qemu.almalinux-10-gencloud-x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.almalinux-10-gencloud-aarch64 .
```

#### AlmaLinux OS Kitten 10

`x86_64` Unified Boot (BIOS and UEFI):

```sh
packer build -only=qemu.almalinux-kitten-10-gencloud-x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.almalinux-kitten-10-gencloud-aarch64 .
```


### Rocky Linux


#### Rocky Linux 8

`x86_64` Unified Boot (BIOS and UEFI):

```sh
packer build -only=qemu.rockylinux-8-gencloud-x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.rockylinux-8-gencloud-aarch64 .
```

#### Rocky Linux 9

`x86_64` Unified Boot (BIOS and UEFI):

```sh
packer build -only=qemu.rockylinux-9-gencloud-x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.rockylinux-9-gencloud-aarch64 .
```

#### Rocky Linux 10

`x86_64` Unified Boot (BIOS and UEFI):

```sh
packer build -only=qemu.rockylinux-10-gencloud-x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.rockylinux-10-gencloud-aarch64 .
```


### CentOS Stream


#### CentOS Stream 9

`x86_64`:

```sh
packer build -only=qemu.centos_stream_9_gencloud_x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.centos_stream_9_gencloud_aarch64 .
```

#### CentOS Stream 10

`x86_64`:

```sh
packer build -only=qemu.centos_stream_10_gencloud_x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.centos_stream_10_gencloud_aarch64 .
```


### Fedora


#### Fedora 43

`x86_64`:

```sh
packer build -only=qemu.fedora_43_gencloud_x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.fedora_43_gencloud_aarch64 .
```

#### Fedora 44

`x86_64`:

```sh
packer build -only=qemu.fedora_44_gencloud_x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.fedora_44_gencloud_aarch64 .
```


### Debian


#### Debian 11

`x86_64`:

```sh
packer build -only=qemu.debian_11_gencloud_x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.debian_11_gencloud_aarch64 .
```

#### Debian 12

`x86_64`:

```sh
packer build -only=qemu.debian_12_gencloud_x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.debian_12_gencloud_aarch64 .
```

#### Debian 13

`x86_64`:

```sh
packer build -only=qemu.debian_13_gencloud_x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.debian_13_gencloud_aarch64 .
```


### Ubuntu


#### Ubuntu 22.04

`x86_64`:

```sh
packer build -only=qemu.ubuntu_22_04_gencloud_x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.ubuntu_22_04_gencloud_aarch64 .
```

#### Ubuntu 24.04

`x86_64`:

```sh
packer build -only=qemu.ubuntu_24_04_gencloud_x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.ubuntu_24_04_gencloud_aarch64 .
```

#### Ubuntu 26.04

`x86_64`:

```sh
packer build -only=qemu.ubuntu_26_04_gencloud_x86_64 .
```

`AArch64`:

```sh
packer build -only=qemu.ubuntu_26_04_gencloud_aarch64 .
```


## Configuration

### Key Packer Variables

| Variable | Default | Description |
| :--- | :---: | :--- |
| `gencloud_disk_size` | `5G` | Virtual disk size for the build VM |
| `gencloud_ssh_username` | `root` | SSH username for Ansible provisioning |

Override variables via command line or `.auto.pkrvars.hcl` file:

```sh
packer build -var gencloud_disk_size=10G -only=qemu.almalinux-9-gencloud-x86_64 .
```

### Partition Layout

| OS Family | Architecture | Partitions |
| :--- | :---: | :--- |
| RHEL family | `x86_64` | biosboot (1MB) + ESP (200MB) + /boot (512MB) + / |
| RHEL family | `AArch64` | ESP (200MB) + /boot (512MB) + / |
| Debian | `x86_64` | biosgrub (1MB) + ESP (538MB) + / |
| Debian | `AArch64` | ESP (538MB) + / |
| Ubuntu | both | ESP (538MB) + / |


## HOW TOs

#### How to build UEFI and Secure Boot supported Images

You need a `1.0.7` or newer version of the [QEMU packer plugin](https://github.com/hashicorp/packer-plugin-qemu) and [OVMF](https://github.com/tianocore/tianocore.github.io/wiki/OVMF) to build UEFI images.

The `ovmf_code` and `ovmf_vars` Packer variables are set to default OVMF Secure Boot paths for the EL and Fedora. Use the table below for the OVMF package name and the firmware paths for your distro.

| Distro | Package |`ovmf_code` | `ovmf_vars` |
| :---:  | :---: | :---: | :--: |
| Arch Linux | `edk2-ovmf` |`/usr/share/OVMF/OVMF_CODE.secboot.fd` | `/usr/share/OVMF/OVMF_VARS.fd` |
| Debian and derivatives | `ovmf` | `/usr/share/OVMF/OVMF_CODE.secboot.fd` | `/usr/share/OVMF/OVMF_VARS.ms.fd` |
| Gentoo | `edk2-ovmf` | `/usr/share/edk2-ovmf/OVMF_CODE.secboot.fd` | `/usr/share/edk2-ovmf/OVMF_VARS.secboot.fd` |
| OpenSUSE | `qemu-ovmf-x86_64` | `/usr/share/qemu/ovmf-x86_64-smm-ms-code.bin` | `/usr/share/qemu/ovmf-x86_64-smm-ms-vars.bin` |

If your distro is not present in the table above or you want to build in different combinations like without Secure Boot, with AMD SEV or Intel TDX, check QEMU firmware metadata files in `/usr/share/qemu/firmware` for the correct paths and combinations.

EL:

```sh
packer build -var qemu_binary="/usr/libexec/qemu-kvm" -only=qemu.almalinux-9-gencloud-x86_64 .
```

Fedora:

```sh
packer build -only=qemu.almalinux-9-gencloud-x86_64 .
```

Debian and derivatives:

```sh
packer build -var ovmf_code="/usr/share/OVMF/OVMF_CODE.secboot.fd" -var ovmf_vars="/usr/share/OVMF/OVMF_VARS.ms.fd" -only=qemu.almalinux-8-gencloud-x86_64 .
```

or set the `ovmf_code` and  `ovmf_vars` Packer variables in `.auto.pkrvars.hcl` file:

`uefi.auto.pkrvars.hcl` in OpenSUSE:

```hcl
ovmf_code = "/usr/share/qemu/ovmf-x86_64-smm-ms-code.bin"
ovmf_vars = "/usr/share/qemu/ovmf-x86_64-smm-ms-vars.bin"
```


## Requirements

* [Packer](https://www.packer.io/) `>= 1.7.0`
* [Ansible](https://www.ansible.com/) `>= 2.12`
  * When building AlmaLinux 8 images, the Ansible version has to be `<= 2.16` for compatibility reasons.
* [QEMU](https://www.qemu.org/)
* [EDK II](https://github.com/tianocore/tianocore.github.io/wiki/OVMF) (for UEFI supported `x86_64` and all `AArch64` images)


## FAQ:


### Nothing happens after invoking the packer command

The [cracklib-dicts's](https://sourceforge.net/projects/cracklib/) `/usr/sbin/packer` takes precedence over Hashicorp's `/usr/bin/packer` in the `$PATH`.
Use `packer.io` instead of the `packer`. See: https://learn.hashicorp.com/tutorials/packer/get-started-install-cli#troubleshooting

```sh
ln -s /usr/bin/packer /usr/bin/packer.io
```

### "qemu-system-x86_64": executable file not found in $PATH

Output:

`Failed creating Qemu driver: exec: "qemu-system-x86_64": executable file not found in $PATH`

By default, Packer looks for QEMU binary as `qemu-system-x86_64`. If it is different in your system, You can set your qemu binary with the `qemu_binary` Packer variable.

on EL, it's `/usr/libexec/qemu-kvm`:

```sh
packer build -var qemu_binary="/usr/libexec/qemu-kvm" -only=qemu.almalinux-8-gencloud-x86_64 .
```

or set the `qemu_binary` Packer variable in `.auto.pkrvars.hcl` file:

`qemu_on_el.auto.pkrvars.hcl`

```hcl
qemu_binary = "/usr/libexec/qemu-kvm"
```

### File transfer fails with OpenSSH < 9.0/9.0p1

On AlmaLinux OS 8, Debian 11 (bullseye) and Ubuntu 20.04 LTS (Focal Fossa), comment `"ANSIBLE_SCP_EXTRA_ARGS=-O"` Ansible variable:

```sh
sed -i 's/.*\("ANSIBLE_SCP_EXTRA_ARGS=-O"\).*/# \1/g' almalinux*.pkr.hcl
```

Error output:

```sh
fatal: [default]: FAILED! => {"msg": "failed to transfer file to /home/vagrant/.ansible/tmp/ansible-local-3759yjc1ghcz/tmpzo9a3_vb/grub.conf.j2 /tmp/ansible-tmp-1715955434.1781824-3861-34379722779259/source:\n\nunknown option -- O\r\nusage: scp [-346BCpqrTv] [-c cipher] [-F ssh_config] [-i identity_file]\n            [-J destination] [-l limit] [-o ssh_option] [-P port]\n            [-S program] source ... target\n"}
```

### Packer's Ansible Plugin can't connect via SSH on SHA1 disabled system

**FIXED:** Starting with the `1.1.0` version, `ECDSA` keypair is generated and used by default instead of `RSA`.

To upgrade the plugin and disable SHA1:

```sh
packer init -upgrade .
update-crypto-policies --set DEFAULT
```

Error output:

```sh
fatal: [default]: UNREACHABLE! => {"changed": false, "msg": "Data could not be sent to remote host \"127.0.0.1\". Make sure this host can be reached over ssh: ssh_dispatch_run_fatal: Connection to 127.0.0.1 port 43729: error in libcrypto\r\n", "unreachable": true}
```

Enable the `SHA1` on the system's default crypto policy until Packer's Ansible Plugin use a stronger key types and signature algorithms(`rsa-sha2-256`,` rsa-sha2-512`, `ecdsa-sha2-nistp256`, `ssh-ed25519`) than `ssh-rsa`.

Fedora and EL:

```sh
update-crypto-policies --set DEFAULT:SHA1
```
