#
# Genericx86-64
#

IMAGE_FSTYPES_append = " balenaos-img"

# Do not support live USB stick
NOISO = "1"
NOHDD = "1"

# Customize balenaos-img
BALENA_IMAGE_BOOTLOADER = "grub-efi grub"
BALENA_BOOT_PARTITION_FILES = " \
    grub-efi-bootx64.efi:/EFI/BOOT/bootx64.efi \
    grub:/grub/ \
    grub/x86_64-efi:/EFI/BOOT/x86_64-efi/ \
    grubenv:/grub/grubenv \
    grubenv:/EFI/BOOT/grubenv \
    grub_extraenv:/grub/grub_extraenv \
    grub_extraenv:/EFI/BOOT/grub_extraenv \
    "


IMAGE_INSTALL_append = " efibootmgr"
