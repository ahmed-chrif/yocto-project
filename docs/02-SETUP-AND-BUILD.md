# 02 — Setup and Build (copy-paste)

## Host packages (Ubuntu)

sudo apt update
sudo apt install -y gawk wget git diffstat unzip texinfo gcc build-essential \
  chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils \
  iputils-ping python3-git python3-jinja2 zstd liblz4-tool file locales libacl1

## Paths — kas/include/local.yml

Default DL_DIR/SSTATE_DIR use /mnt/storage/yocto/...
If missing, set:
  DL_DIR = "${TOPDIR}/../downloads"
  SSTATE_DIR = "${TOPDIR}/../sstate-cache"

## Native Kas build

python3 -m venv yocto-venv && source yocto-venv/bin/activate
pip install kas
kas build kas/kas-core-image-base-rpi02.yml

## Docker helper

./docker/docker.sh build kas/kas-core-image-base-rpi02.yml
# fix: docker.sh has exit 1 after kas-container → use exit $?

## Artifacts

build/tmp/deploy/images/raspberrypi0-2w-64/
  core-image-minimal-raspberrypi0-2w-64.wic.bz2
  chrif-image-var-raspberrypi0-2w-64.btrfs

## Flash

lsblk
sudo bmaptool copy build/tmp/deploy/images/raspberrypi0-2w-64/core-image-minimal-raspberrypi0-2w-64.wic.bz2 /dev/sdX

## Serial

115200 8N1, root empty password (debug-tweaks).
ENABLE_UART=1 and dtoverlay=disable-bt in local.yml.

Next: 03-PROJECT-STRUCTURE.md
