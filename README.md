# 🚀 Yocto Project — Student Learning Repository

> **Beginner-friendly Yocto project for Raspberry Pi Zero 2 W**  
> Docs style inspired by [TripleHelixConsulting/meta-thc-v1](https://github.com/TripleHelixConsulting/meta-thc-v1)

---

## 📋 Project Overview

| 🎯 **Aspect** | 📝 **Details** |
|---|---|
| **Target Hardware** | Raspberry Pi Zero 2 W (64-bit) |
| **Yocto Release** | Scarthgap |
| **Build System** | Kas (+ optional Docker) |
| **Philosophy** | Teaching embedded Linux through practical, hands-on examples |

---

## 🎓 What You'll Learn

This project goes **beyond "hello world"** by teaching:

| Topic | Path in Repo |
|-------|--------------|
| 🏗️ Kas composition | `kas/`, `kas/include/*.yml` |
| 🎨 Custom distro | `meta-chrif-distro/conf/distro/chrif.conf` |
| 🖼️ Image + WIC | `core-image-minimal.bbappend`, `chrif-image-var.bb`, `sdimage-rpi02w-var.wks` |
| 💾 Separate `/var` | `chrif-var-mount`, `files/var.mount` |
| ⚙️ Systemd backport | `meta-chrif-distro/recipes-core/systemd/`, `meson_tags.bbclass` |
| 🔧 Kernel fragment | `meta-yfs-bsp/.../btrfs.cfg` (experimental layout) |
| **🚗 Out-of-tree drivers** | Real kernel driver examples + integration |
| **🌳 Device tree overlays** | Working DT overlay examples with enable instructions |

---

## ⚡ Quick Start

### 🛠️ Prerequisites

- Linux host (Ubuntu 22.04 / 24.04 recommended) **or** Docker
- ~60–80 GB free disk space
- Git + Python 3

### 🐳 Option 1: Kas + Docker (Recommended)

```bash
git clone https://github.com/ahmed-chrif/yocto-project.git
cd yocto-project

# Optional: install host packages
./setup-host.sh

# Build
./docker/docker.sh build kas/kas-core-image-base-rpi02.yml
```

### 📦 Option 2: Native Kas

```bash
python3 -m venv yocto-venv && source yocto-venv/bin/activate
pip install kas
kas build kas/kas-core-image-base-rpi02.yml
```

### 💾 Flash to SD Card

After the build finishes, the image is at:

```
build/tmp/deploy/images/raspberrypi0-2w-64/
```

Flash it (replace `/dev/sdX` with your device):

```bash
sudo dd if=build/tmp/deploy/images/raspberrypi0-2w-64/*.wic \
        of=/dev/sdX bs=4M status=progress conv=fsync
```

---

## 📂 Project Structure

```
yocto-project/
├── kas/                      # 🏗️  Kas build configurations (preferred)
├── docker/                   # 🐳 Docker helpers
├── meta-chrif/               # 🔨 Common / utility layer
├── meta-chrif-bsp/           # 🖥️  Board Support Package (drivers + DT)
├── meta-chrif-distro/        # 📦 Distro policy & image recipes
├── docs/                     # 📚 Learning guides
└── README.md
```

### Layer Responsibilities

| Layer | Purpose |
|-------|---------|
| **meta-chrif** | Shared utilities and common recipes |
| **meta-chrif-bsp** | Machine definitions, kernel drivers, device tree |
| **meta-chrif-distro** | Distribution policy (`chrif`) and image definitions |

---

## ✅ What's Configured

- ✨ **Distro:** `chrif` (Scarthgap-based)
- 🔐 **Init system:** systemd
- 🔑 **SSH:** Dropbear (enabled via `debug-tweaks`)
- 📡 **Connectivity:** WiFi support + Raspberry Pi firmware
- 🖥️ **Serial:** UART enabled + Bluetooth disabled
- ⚙️ **Image tuning:** Optimized for embedded use

---

## 📚 Documentation Path (Recommended Order)

Start here and follow the progression:

1. **[01 - Yocto Basics](docs/01-YOCTO-BASICS.md)**  
   Concepts explained simply

2. **[02 - Setup & Build](docs/02-SETUP-AND-BUILD.md)**  
   Detailed setup and build instructions

3. **[03 - Project Structure](docs/03-PROJECT-STRUCTURE.md)**  
   How the layers work together

4. **[04 - First Boot](docs/04-FIRST-BOOT.md)**  
   Flashing, serial console, SSH, WiFi

5. **[05 - Kernel Drivers](docs/05-KERNEL-DRIVERS.md)** ⭐  
   **Out-of-tree driver example**

6. **[06 - Device Tree Overlays](docs/06-DEVICE-TREE-OVERLAYS.md)** ⭐  
   **Device tree overlay examples**

7. **[07 - Adding Recipes](docs/07-ADDING-RECIPES.md)**  
   Creating and integrating custom recipes

8. **[08 - Troubleshooting](docs/08-TROUBLESHOOTING.md)**  
   Common issues and solutions

---

## 🎯 Why This Repository?

Most beginner Yocto projects stop at userspace. **This one doesn't.**

✅ **Complete, documented out-of-tree kernel driver example**  
✅ **Working device tree overlay examples with clear instructions**  
✅ **Explanations of BSP layer structure and philosophy**  
✅ **Clean, educational layer organization**

These are the topics that turn a "hello world" image into **real embedded systems knowledge**.

---

## 📊 Current Status

### ✅ Working

- Kas configuration for Raspberry Pi Zero 2 W 64-bit
- Custom distro with SSH + WiFi support
- Systemd integration and image customizations
- Clean, educational layer layout

### 🔄 Next Focus

- Expand kernel driver and device tree overlay examples
- Add more machine configurations
- Improve first-boot experience

---

## 📋 Language Composition

- **BitBake** — 94% (Yocto recipes)
- **Shell** — 6% (Build/utility scripts)

---

## 📄 License

MIT (see `COPYING.MIT` in each layer)

---

## 🚀 Getting Started

**→ [Start with the Quick Start above, then dive into the `docs/` folder →](docs/01-YOCTO-BASICS.md)**
