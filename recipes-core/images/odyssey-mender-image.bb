SUMMARY = "A console-only image that fully supports the odyssey-x86 device \
and mender.io cloud."

IMAGE_FEATURES += "splash"

inherit core-image

LICENSE = "MIT"

CONF_VERSION = "1"
MENDER_ARTIFACT_NAME = "release-1"
INHERIT += "mender-full"
DISTRO_FEATURES_append = " systemd"
VIRTUAL-RUNTIME_init_manager = "systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
VIRTUAL-RUNTIME_initscripts = ""
MENDER_STORAGE_DEVICE = "/dev/sda"
MENDER_STORAGE_TOTAL_SIZE_MB_DEFAULT = "4096"
MENDER_BOOT_PART_SIZE_MB = "64"
MENDER_DATA_PART_SIZE_MB = "1024"
MENDER_IMAGE_BOOTLOADER_FILE = "wic-initrd"

IMAGE_FEATURES += " \
    ssh-server-openssh \
    "
CORE_IMAGE_EXTRA_INSTALL += "acpica acpitool acpi-tables"


