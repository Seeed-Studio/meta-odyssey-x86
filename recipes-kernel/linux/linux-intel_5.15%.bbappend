FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://defconfig \
    file://can-and-lcd-devices.cfg \
"

include ${@mender_feature_is_enabled("mender-client-install","linux-intel-mender.inc","",d)}
