# 01 — Yocto Basics (from this repository)

This document explains the core Yocto concepts **using the files that already exist in this project**.

## 1. What is a layer?

A **layer** is a directory of BitBake metadata. BitBake finds layers via `BBLAYERS` (Kas or oe-init-build-env).

| Layer | Path | Role |
|-------|------|------|
| meta-chrif | `meta-chrif/` | Shared / utility |
| meta-chrif-bsp | `meta-chrif-bsp/` | Board Support (WIC) |
| meta-chrif-distro | `meta-chrif-distro/` | Distro + images + systemd |
| meta-yfs-bsp | `meta-yfs-bsp/` | Experimental machine / kernel fragment |

Every layer needs `conf/layer.conf` (see `meta-chrif/conf/layer.conf`).

## 2. Distro vs Machine vs Image

| Concept | In this repo |
|---------|----------------|
| Distro `chrif` | `meta-chrif-distro/conf/distro/chrif.conf` |
| Machine | `raspberrypi0-2w-64` (meta-raspberrypi) |
| Image | `core-image-minimal` + our bbappend |

Kas sets all three in `kas/kas-core-image-base-rpi02.yml`.

## 3. Recipes / bbappend / class

- `.bb` — build a package or image
- `.bbappend` — modify another layer recipe (`core-image-minimal.bbappend`, `systemd_%.bbappend`)
- `.bbclass` — shared logic (`meson_tags.bbclass`)

## 4. Why Kas?

Pins commits, sets machine/distro/target, injects `local.conf` snippets — no hand-edited `bblayers.conf`.

Next: [02-SETUP-AND-BUILD.md](02-SETUP-AND-BUILD.md)
