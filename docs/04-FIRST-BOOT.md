# 04 — First Boot

## Hardware
Pi Zero 2 W + flashed SD + optional USB-UART on GPIO 14/15.

## Serial
115200 8N1:
  sudo screen /dev/ttyUSB0 115200

## Login
root / empty password (debug-tweaks). Change before any public demo.

## Expected
- Serial: ENABLE_UART + disable-bt
- SSH Dropbear: IMAGE_FEATURES
- Wi-Fi tools: wpa-supplicant + rpi firmware
- /var mounted: var.mount (label var, btrfs)

## Checks on target
  lsblk
  findmnt /var
  systemctl status var.mount

Next: 05-SEPARATE-VAR.md
