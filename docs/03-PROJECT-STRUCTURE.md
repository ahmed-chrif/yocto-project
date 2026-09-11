# 03 — Project Structure (file-by-file)

## Top level
- .gitignore — build/, layers/, venv
- docker/docker.sh — venv + kas-container
- kas/ — all Kas YAML

## Kas
- kas-core-image-base-rpi02.yml — machine raspberrypi0-2w-64, distro chrif, target core-image-minimal
- include/local.yml — DL_DIR, SSTATE, threads, ENABLE_UART, disable-bt
- include/oe.yml — OE-Core + bitbake pinned (scarthgap)
- include/rpi.yml — meta-raspberrypi pinned
- include/chrif.yml — local meta-chrif*

## meta-chrif
Utility layer; template example recipe only.

## meta-chrif-bsp
wic/sdimage-rpi02w-var.wks — boot (vfat) + rootfs (ext4) + var (btrfs rawcopy)

## meta-chrif-distro
- conf/distro/chrif.conf — systemd, features, IMAGE_FEATURES, wifi pkgs
- recipes-core/images/chrif-image-var.bb — btrfs /var image
- recipes-core/images/core-image-minimal.bbappend — WIC + empty /var in rootfs
- recipes-core/chrif-var-mount/ — var.mount unit
- recipes-core/systemd/ — systemd 258 backport + BACKPORT-CHANGES.md
- classes/meson_tags.bbclass

## meta-yfs-bsp (experimental)
Machine + btrfs.cfg; non-standard layout; not in Kas chrif.yml by default.

## Generated (do not commit)
layers/, build/, yocto-venv/

Next: 04-FIRST-BOOT.md
