From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Date: Thu, 28 May 2015 20:41:49 +0200
Subject: [Buildroot] [PATCH 4/5] rpi-firmware: update to match linux 3.18.14
In-Reply-To: <1432838510-1848-1-git-send-email-pmjdebruijn@pcode.nl>
References: <1432838510-1848-1-git-send-email-pmjdebruijn@pcode.nl>
Message-ID: <1432838510-1848-4-git-send-email-pmjdebruijn@pcode.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index cbcf790..89d3105 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = b9fac65dd9ff607d0c2c4ea1bbba2bbf3fbc4a10
+RPI_FIRMWARE_VERSION = 70b05985cf2b2b893bc6e55b12794f32857a78dd
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.9.1
