From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Feb 2014 02:07:17 +0100
Subject: [Buildroot] [PATCH] package/rpi-firmware: bump for misc
	enhancements and fixes
Message-ID: <1391389637-14849-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes for h264 video deocding, audio playback and cec.
Some improvements in HDMI output management.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 5d2c0cf..99faa5b 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 940dc3b5ea0a001096c5fbb2d483a961d42fe85c
+RPI_FIRMWARE_VERSION = 98e3be3a7e0ec7d4a86e8edb2177bd8e2bb8728f
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.1.2
