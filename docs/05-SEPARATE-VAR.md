# 05 — Separate /var (as implemented in this repo)

## Goal
Small rootfs; persistent data on its own btrfs partition; mount via systemd, not WIC fstab.

## Pipeline
1. chrif-image-var.bb — mkfs.btrfs -L var, deploy .btrfs
2. sdimage-rpi02w-var.wks — part /var rawcopy of that file
3. core-image-minimal.bbappend — IMAGE_INSTALL chrif-var-mount; WKS_FILE; empties rootfs /var (keeps opkg db)
4. var.mount — What=/dev/disk/by-label/var Where=/var Type=btrfs
5. WIC_CREATE_EXTRA_ARGS = "--no-fstab-update"
6. do_image_wic[depends] += "chrif-image-var:do_deploy"

## Learn
IMAGE_FSTYPES + WKS_FILE, rawcopy, systemd mount units, why rootfs /var is emptied.

Next: 07-KNOWN-ISSUES.md
