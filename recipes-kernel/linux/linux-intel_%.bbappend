FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
LINUX_X86_BRANCH ?= "linux-5.10.y"

# Set default SRCREVs. Both the machine and meta SRCREVs are statically set
# to the as in 5.10 recipe

SRCREV="${AUTOREV}"
SRCREV_machine = "${AUTOREV}"
SRCREV_meta = "${AUTOREV}"

SRC_URI = " \
	git://mirrors.tuna.tsinghua.edu.cn/git/linux-stable.git;protocol=https;name=machine;branch=${LINUX_X86_BRANCH} \
	git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${KMETA_BRANCH};destsuffix=${KMETA} \
    "
#SRC_URI = " \
#    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git;name=machine;branch=${LINUX_X86_BRANCH} \
#    "

SRC_URI_append = "file://defconfig \
		  file://can-and-lcd-devices.cfg \
		"

include ${@mender_feature_is_enabled("mender-client-install","linux-intel-mender.inc","",d)}

# Disable version check so that we don't have to edit this recipe every time
# upstream bumps the version
KERNEL_VERSION_SANITY_SKIP = "1"
