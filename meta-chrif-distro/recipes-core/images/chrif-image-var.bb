SUMMARY = "Chrif persistent /var image (Avocado-style)"
DESCRIPTION = "Minimal btrfs image for /var with sysext/confext directories"
LICENSE = "MIT"

PV = "${DISTRO_VERSION}"

inherit deploy

DEPENDS += "btrfs-tools-native"

fakeroot do_compile() {
    # 1. Clean up working location
    rm -rf ${WORKDIR}/btrfs_root
    
    # 2. Seed the expected systemd directories
    install -o root -g root -d ${WORKDIR}/btrfs_root/lib/extensions
    install -o root -g root -d ${WORKDIR}/btrfs_root/lib/confexts

    # 3. Create standard BTRFS filesystem from the root directory
    mkfs.btrfs \
        -r ${WORKDIR}/btrfs_root \
        -L var \
        -f ${WORKDIR}/chrif-image-var-${MACHINE}.btrfs
}

do_deploy() {
    install -d ${DEPLOYDIR}
    install -m 0644 ${WORKDIR}/chrif-image-var-${MACHINE}.btrfs \
        ${DEPLOYDIR}/chrif-image-var-${MACHINE}.btrfs
}

addtask deploy after do_compile before do_build