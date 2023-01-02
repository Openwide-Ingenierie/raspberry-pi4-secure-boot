################################################################################
#
# raspberrypi-usbboot
#
################################################################################

RASPBERRYPI_USBBOOT_VERSION = 20221215-105525
RASPBERRYPI_USBBOOT_SITE = \
	$(call github,raspberrypi,usbboot,$(RASPBERRYPI_USBBOOT_VERSION))
RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
RASPBERRYPI_USBBOOT_LICENSE_FILES = LICENSE

HOST_RASPBERRYPI_USBBOOT_DEPENDENCIES = host-libusb

define HOST_RASPBERRYPI_USBBOOT_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
endef

define HOST_RASPBERRYPI_USBBOOT_INSTALL_CMDS
	$(INSTALL) -D -m 0644 $(@D)/secure-boot-recovery/bootcode4.bin $(BINARIES_DIR)/recovery.bin
	$(INSTALL) -D -m 0644 $(@D)/secure-boot-recovery/pieeprom.original.bin $(BINARIES_DIR)
	$(INSTALL) -D -m 0644 $(@D)/secure-boot-recovery/boot.conf $(BINARIES_DIR)
endef

$(eval $(host-generic-package))
