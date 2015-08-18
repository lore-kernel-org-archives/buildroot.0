From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:38:36 +0200
Subject: [Buildroot] [git commit branch/next] package/rpi-firmware: bump
	version
Message-ID: <20150818123919.E3DC7807EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81b01ce22308976c241fdad7c39ca237b40e9c9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Misc enhancements and fixes all over the place, most notably:
 - FW: better overclocking, add Mediatek mt7601u Wi-Fi driver, bump
       kernel version to 4.1.5...
 - DT: fix SPI, I??S, gpio-poweroff, add MCP7941X, uart1, Fen Logic
       VGA666 board, RPi Sense HAT...
 - video: add early frame sequential 3D support, YUV_UV destination
          format, qpu deinterlace...

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 1ef15aa..2436376 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 856e2e1907a7f7058289c30268515c8cbf3fa5e3
+RPI_FIRMWARE_VERSION = 52f65ac4ad1ef1d2838fa2f921d5bc3ece4c777b
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
