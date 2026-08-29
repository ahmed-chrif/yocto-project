SUMMARY = "Mount unit for separate /var partition"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "file://var.mount"

S = "${WORKDIR}"

inherit systemd

SYSTEMD_SERVICE:${PN} = "var.mount"
SYSTEMD_AUTO_ENABLE = "enable"

do_install() {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/var.mount ${D}${systemd_system_unitdir}/var.mount
}

FILES:${PN} += "${systemd_system_unitdir}/var.mount"
