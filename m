From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Aug 2014 23:22:24 +0200
Subject: [Buildroot] [PATCH 2/3] package/rpi-firmware: Bump version to
	kernel 3.12.25
In-Reply-To: <1407014545-25541-1-git-send-email-bernd.kuhls@t-online.de>
References: <1407014545-25541-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1407014545-25541-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version bump, amongst other things, introduces
OMX_ImageFilterDeInterlaceFast, which is needed by
the upcoming xbmc/kodi version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index ca9b5eb..49b4661 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = f15c3b5e4018b974de30d95d3173b1e936f66bd7
+RPI_FIRMWARE_VERSION = 16ebc76904699b036f709beb65ee5ff70f83190b
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.7.10.4
