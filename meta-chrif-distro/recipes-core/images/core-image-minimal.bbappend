# Separate /var partition (Avocado-style)
IMAGE_INSTALL:append = " chrif-var-mount btrfs-tools"

# Use our WIC layout
WKS_FILE = "sdimage-rpi02w-var.wks"
IMAGE_FSTYPES = "wic.bz2 wic.bmap"

# Do not let WIC rewrite fstab for /var; systemd unit owns the mount
WIC_CREATE_EXTRA_ARGS = "--no-fstab-update"

# Ensure the pre-built var btrfs image is in DEPLOY_DIR_IMAGE before WIC runs
do_image_wic[depends] += "chrif-image-var:do_deploy"

# Keep mountpoint while preserving opkg database required by OE postinst checks
ROOTFS_POSTPROCESS_COMMAND:append = " chrif_empty_var;"

chrif_empty_var() {
    # Delete everything inside /var EXCEPT /var/lib
    find ${IMAGE_ROOTFS}/var -mindepth 1 -maxdepth 1 ! -name 'lib' -exec rm -rf {} +
    
    # Inside /var/lib, delete everything EXCEPT /var/lib/opkg
    if [ -d "${IMAGE_ROOTFS}/var/lib" ]; then
        find ${IMAGE_ROOTFS}/var/lib -mindepth 1 -maxdepth 1 ! -name 'opkg' -exec rm -rf {} +
    fi

    # Ensure empty target mountpoint exists
    mkdir -p ${IMAGE_ROOTFS}/var
}