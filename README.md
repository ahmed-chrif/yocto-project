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

## 📚 Documentation

Explore the `docs/` folder for detailed guides on:

- Yocto basics and concepts
- Setup and build procedures
- Project structure and layers
- First boot and device configuration
- Custom recipes and configurations
- Troubleshooting and common issues

---

## 🎯 Differentiation

Most beginner Yocto projects stop at userspace. This repository takes a practical, educational approach to embedded Linux by emphasizing:

- Real, working Kas configurations
- Clean layer organization with clear responsibilities
- Scarthgap-based custom distro
- Systemd integration patterns
- Board Support Package structure for Raspberry Pi

---

## 📊 Current Status

### ✅ Working

- Kas configuration for Raspberry Pi Zero 2 W 64-bit
- Custom distro with SSH + WiFi support
- Systemd integration and image customizations
- Clean, educational layer layout

### 🔄 Next Focus

- Expand examples and documentation
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

**→ [Start with the Quick Start above, then explore the `docs/` folder →](docs/)**
