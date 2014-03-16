From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Mar 2014 16:25:23 +0100
Subject: [Buildroot] [PATCH 1/3] package/rpi-firmware: bump version
In-Reply-To: <cover.1394983430.git.yann.morin.1998@free.fr>
References: <cover.1394983430.git.yann.morin.1998@free.fr>
Message-ID: <2ba86d3d20e555e5b9ea7aad6cc0c38a13eba8b3.1394983430.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump for misc fixes and enhancements:
  - firmware: smaller cut-down (aka rescue) firmware
  - audio: sample rates, float samples, any-number-of-channels
  - hdmi: fix for (high?) output rates
  - video: h264 decode when changing resolution
  - camera: high frame rates, full FoV

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index a849d32..5bc65ff 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = a0eb06736a3f1583fc6cd575149c7835dc43582d
+RPI_FIRMWARE_VERSION = 089cfb05ec350505ee84a99d567474c5bdc0505e
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.3.2
