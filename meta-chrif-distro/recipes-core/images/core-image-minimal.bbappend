# Separate /var partition (Avocado-style)
IMAGE_INSTALL:append = " chrif-var-mount btrfs-tools"

# Use our WIC layout
WKS_FILE = "sdimage-rpi02w-var.wks"
IMAGE_FSTYPES = "wic.bz2 wic.bmap"

# Do not let WIC rewrite fstab for /var; systemd unit owns the mount
WIC_CREATE_EXTRA_ARGS = "--no-fstab-update"

# Ensure the pre-built var btrfs image is in DEPLOY_DIR_IMAGE before WIC runs
do_image_wic[depends] += "chrif-image-var:do_deploy"

# Keep an empty /var directory in the rootfs as mountpoint
ROOTFS_POSTPROCESS_COMMAND:append = " chrif_empty_var;"
chrif_empty_var() {
    rm -rf ${IMAGE_ROOTFS}/var/*
    # leave the directory itself so the mount point exists
    mkdir -p ${IMAGE_ROOTFS}/var
}
