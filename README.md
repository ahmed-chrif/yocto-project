<<<<<<< HEAD
# Yocto Project – Learning & Custom BSP

A practical, beginner-friendly Yocto repository focused on real embedded Linux skills.

This project teaches you how to:
- Build a working custom image for Raspberry Pi (Zero 2 W and others)
- Understand layers, recipes, distros and machines
- Write and integrate an **out-of-tree kernel driver**
- Create and apply **device tree overlays**

It follows the documentation-first philosophy of [TripleHelixConsulting/meta-thc-v1](https://github.com/TripleHelixConsulting/meta-thc-v1) while going deeper into BSP topics that most beginner repositories avoid.
=======
# yocto-project — Student Learning Repository (Raspberry Pi Zero 2 W)

> Beginner-friendly Yocto project (docs style inspired by [TripleHelixConsulting/meta-thc-v1](https://github.com/TripleHelixConsulting/meta-thc-v1)).

**Target:** Raspberry Pi Zero 2 W 64-bit · **Release:** Scarthgap · **Build:** Kas (+ optional Docker)

Teaching project (not production). Shows: layers/distro/machine/image, Kas pin commits, custom distro `chrif`, separate btrfs `/var` + systemd mount, systemd 258 backport patterns.

---

## What you learn (mapped to this tree)

| Topic | Path in repo |
|-------|----------------|
| Kas composition | `kas/`, `kas/include/*.yml` |
| Custom distro | `meta-chrif-distro/conf/distro/chrif.conf` |
| Image + WIC | `core-image-minimal.bbappend`, `chrif-image-var.bb`, `sdimage-rpi02w-var.wks` |
| Separate `/var` | `chrif-var-mount`, `files/var.mount` |
| Systemd backport | `meta-chrif-distro/recipes-core/systemd/`, `meson_tags.bbclass` |
| Kernel fragment | `meta-yfs-bsp/.../btrfs.cfg` (experimental layout) |
>>>>>>> bf7d78a (Fixing docs)

---

## Quick Start

<<<<<<< HEAD
### Prerequisites
- Linux host (Ubuntu 22.04 / 24.04 recommended) **or** Docker
- ~60–80 GB free disk space
- Git + Python 3

### Recommended: Kas + Docker

```bash
git clone https://github.com/ahmed-chrif/yocto-project.git
cd yocto-project

# Optional: install host packages
./setup-host.sh

# Build
./docker/docker.sh build kas/kas-core-image-base-rpi02.yml
```

### Alternative: Native Kas

```bash
python3 -m venv yocto-venv && source yocto-venv/bin/activate
pip install kas
kas build kas/kas-core-image-base-rpi02.yml
```

After the build finishes, the image is here:

```
build/tmp/deploy/images/raspberrypi0-2w-64/
```

Flash it (replace `/dev/sdX`):

```bash
sudo dd if=build/tmp/deploy/images/raspberrypi0-2w-64/*.wic \
        of=/dev/sdX bs=4M status=progress conv=fsync
```

---

## Project Structure

```
yocto-project/
├── kas/                      # Kas build configurations (preferred)
├── docker/                   # Docker helpers
├── meta-chrif/               # Common / utility layer
├── meta-chrif-bsp/           # Board Support Package  ← drivers + DT live here
├── meta-chrif-distro/        # Distro + image recipes
├── docs/                     # Learning guides (start after this README)
└── README.md
```

| Layer                | Role                                      |
|----------------------|-------------------------------------------|
| `meta-chrif`         | Shared utilities                          |
| `meta-chrif-bsp`     | Machines, kernel drivers, device tree     |
| `meta-chrif-distro`  | Distro policy (`chrif`) and images        |

---

## What is already configured

- Distro: `chrif` (scarthgap based)
- Init system: systemd
- SSH: Dropbear (enabled via `debug-tweaks`)
- WiFi support + Raspberry Pi firmware
- UART enabled + Bluetooth disabled (for reliable serial console)
- Image features tuned for embedded use

---

## Documentation Path (recommended order)

1. [docs/01-YOCTO-BASICS.md](docs/01-YOCTO-BASICS.md) – Concepts explained simply
2. [docs/02-SETUP-AND-BUILD.md](docs/02-SETUP-AND-BUILD.md) – Detailed setup & build
3. [docs/03-PROJECT-STRUCTURE.md](docs/03-PROJECT-STRUCTURE.md) – How the layers work
4. [docs/04-FIRST-BOOT.md](docs/04-FIRST-BOOT.md) – Flashing, serial, SSH, WiFi
5. [docs/05-KERNEL-DRIVERS.md](docs/05-KERNEL-DRIVERS.md) – **Out-of-tree driver example**
6. [docs/06-DEVICE-TREE-OVERLAYS.md](docs/06-DEVICE-TREE-OVERLAYS.md) – **DT overlays**
7. [docs/07-ADDING-RECIPES.md](docs/07-ADDING-RECIPES.md)
8. [docs/08-TROUBLESHOOTING.md](docs/08-TROUBLESHOOTING.md)

---

## Differentiation

Most beginner Yocto projects stop at userspace.  
This repository deliberately includes:

- A complete, documented **out-of-tree kernel driver** example
- Working **device tree overlay** examples with clear enable instructions
- Explanations of *why* the BSP layer is structured the way it is

These are the topics that turn a "hello world" image into real embedded systems knowledge.

---

## Current Status

**Working**
- Kas configuration for Raspberry Pi Zero 2 W 64-bit
- Custom distro with SSH + WiFi support
- Systemd integration and some image customizations
- Clean layer layout

**Next focus**
- Expand the kernel driver and DT overlay examples
- Add more machine configurations
- Improve first-boot experience

---

## License

MIT (see `COPYING.MIT` in each layer).

---

**Start with the Quick Start above, then move to the `docs/` folder.**
=======
### Native Kas

```bash
cd ~/project
# Edit kas/include/local.yml if you have no /mnt/storage (DL_DIR / SSTATE_DIR)
python3 -m venv yocto-venv && source yocto-venv/bin/activate
pip install kas
kas build kas/kas-core-image-base-rpi02.yml
>>>>>>> bf7d78a (Fixing docs)
