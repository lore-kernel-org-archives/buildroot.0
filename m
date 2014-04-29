From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Apr 2014 20:08:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/rpi-firmware: bump for enhancements
	and bug fixes
In-Reply-To: <cover.1398794817.git.yann.morin.1998@free.fr>
References: <cover.1398794817.git.yann.morin.1998@free.fr>
Message-ID: <2043361e31c1b1b6662fe2b3a42be3edb64f76a3.1398794817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes and enhancements for:
  - video: add 3D stereo, unusual streams with skipped frames
  - audio: reset-on-flush, alsa passthrough, volume
  - misc : SDRAM drive strength
  - some undocumented changes

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 1c85b83..138c37d 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 04ba1c03780ae708c9289bce14f56933e55e9c20
+RPI_FIRMWARE_VERSION = 81e54c47b1cb26dd3990cbc970f4ddd3614196e8
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.3.2
