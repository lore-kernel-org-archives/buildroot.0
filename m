From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 11:45:31 +0200
Subject: [Buildroot] [PATCH 1/3] package/rpi-firmware: bump revision for a
	lot of fixes + enhancements
In-Reply-To: <cover.1411811051.git.yann.morin.1998@free.fr>
References: <cover.1411811051.git.yann.morin.1998@free.fr>
Message-ID: <04d84694f2c39223db16cb56333688a09614abff.1411811051.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 49b4661..033ff33 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 16ebc76904699b036f709beb65ee5ff70f83190b
+RPI_FIRMWARE_VERSION = 53162d55fa557e60453c0652aa00fa3daf4ed618
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.9.1
