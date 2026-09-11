# Separate /var (Avocado-style)
IMAGE_INSTALL:append = " chrif-var-mount btrfs-tools"

# Immutable root (Avocado: read-only-rootfs + compressed RO image)
# Avocado uses erofs-lz4; we use squashfs
IMAGE_FEATURES:append = " read-only-rootfs"

# squashfs artifact for the rootfs partition + final disk image
IMAGE_FSTYPES = "squashfs wic.bz2 wic.bmap"

WKS_FILE = "sdimage-rpi02w-var.wks"
WIC_CREATE_EXTRA_ARGS = "--no-fstab-update"

do_image_wic[depends] += "chrif-image-var:do_deploy"

# Keep /var as mountpoint; keep opkg DB for image postinst checks
ROOTFS_POSTPROCESS_COMMAND:append = " chrif_empty_var;"

chrif_empty_var() {
    find ${IMAGE_ROOTFS}/var -mindepth 1 -maxdepth 1 ! -name 'lib' -exec rm -rf {} +
    if [ -d "${IMAGE_ROOTFS}/var/lib" ]; then
        find ${IMAGE_ROOTFS}/var/lib -mindepth 1 -maxdepth 1 ! -name 'opkg' -exec rm -rf {} +
    fi
    mkdir -p ${IMAGE_ROOTFS}/var
}
