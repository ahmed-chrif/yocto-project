# 07 — Known Issues

## Tooling
- docker/docker.sh: hard exit 1 after kas-container → use exit $?
- kas/include/local.yml: hard-coded /mnt/storage
- BB_NUMBER_THREADS fixed at 4

## Metadata
- Stock meta-*/README templates
- Typo DISTIBUTION in chrif.conf
- LAYERSERIES_COMPAT has walnasdf
- recipes-example only are placeholders

## BSP
- meta-yfs-bsp layout non-standard
- meta-yfs-bsp not listed in kas/include/chrif.yml

## Docs vs code
No out-of-tree kernel driver or DT overlay in tree yet.

## Security
debug-tweaks / empty root password = learning only.

Fix one item per commit; update this file when done.
