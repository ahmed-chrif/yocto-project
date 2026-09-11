# Raspberry Pi: no UKI. systemd 258 still builds package systemd-ukify with
# RDEPENDS on python3-pefile / python3-pyzstd (not in scarthgap OE-Core).
# Clear them so core-image-minimal can parse without meta-python.

RDEPENDS:${PN}-ukify = ""
RDEPENDS:systemd-ukify = ""

# Do not ship ukify on the target
do_install:append() {
    rm -f ${D}${bindir}/ukify
    rm -rf ${D}${nonarch_libdir}/systemd/ukify
}
