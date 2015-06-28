From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 00:25:13 +0200
Subject: [Buildroot] [PATCH 04/11] package/rpi-firmware: bump version
In-Reply-To: <cover.1435529863.git.yann.morin.1998@free.fr>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
Message-ID: <53817436ae6e2f3b0b4cf4357f22e1674e5a911b.1435529863.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Misc enhancements and fixes all over the place, most notably:
  - FW: fix overclocking, better prioritise sound, fix CMA L1 cache,
        improved DTB/DTB-overlay support, SDcard freq fixes,
        voltages...
  - video: fix decoding weird stuff, fix stereo output...
  - camera: raw image capture, HDR (really?)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 65ee6fb..6299b04 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = b9fac65dd9ff607d0c2c4ea1bbba2bbf3fbc4a10
+RPI_FIRMWARE_VERSION = 856e2e1907a7f7058289c30268515c8cbf3fa5e3
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.9.1
