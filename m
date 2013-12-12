From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Dec 2013 19:08:36 +0100
Subject: [Buildroot] [PATCH] package/rpi-firmware: bump
Message-ID: <1386871716-13900-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This bumps gets us:
  - support for the v4l2 driver
  - fix latencies in vdec3 (h264 decoder)
  - fix incorrect frame presentation in de-interlacing filter

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 838952b..664f6ad 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = f7e9bcd25c9b01521fdf88aac2740b6cfc887dfb
+RPI_FIRMWARE_VERSION = e618d4ff2dc20051bc726834b22487fe2e236fe5
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.1.2
