FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://btrfs.cfg \
    file://squashfs.cfg \
"
