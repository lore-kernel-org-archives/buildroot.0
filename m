From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Sep 2013 00:00:31 +0200
Subject: [Buildroot] [PATCH 2/2] package/rpi-firmware: bump version
In-Reply-To: <cover.1379714259.git.yann.morin.1998@free.fr>
References: <cover.1379714259.git.yann.morin.1998@free.fr>
Message-ID: <4092a345daa1077982e8355fdfa22c27b7240a7f.1379714259.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes for USB and audio; enable video capture.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 55c1ca4..9319429 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = d4f5315
+RPI_FIRMWARE_VERSION = fadc4cb
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.1.2
