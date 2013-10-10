From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Oct 2013 23:10:33 +0200
Subject: [Buildroot] [PATCH] package/rpi-firmware: bump version
Message-ID: <1381439433-12452-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes for de-interlacing of /unusual/ MPEG streams.
Yes, some people seem to enjoy generating MPEG streams in
which interlacing is not constant. That's apparently 100%
valid, but yet very unusual, and at the very least, weird.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index ddb48b3..ecd9dbf 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = e6b21d6
+RPI_FIRMWARE_VERSION = 58036da
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.1.2
