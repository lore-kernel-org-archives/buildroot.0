From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 19:40:15 +0100
Subject: [Buildroot] [PATCH 1/5] package/rpi-firmware: bump for misc
	fixes/improvements
In-Reply-To: <cover.1390070341.git.yann.morin.1998@free.fr>
References: <cover.1390070341.git.yann.morin.1998@free.fr>
Message-ID: <2b45941e91168c720077746a5a8e0a4a7aeb43d8.1390070341.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bring a slew of fixes and improvements to:
  - boot hang
  - camera zoom, night mode
  - MJPEG decoder/encoder
  - video decoder/encoder
  - dispmanx (3D engine)
  - documentation

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 664f6ad..5d2c0cf 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = e618d4ff2dc20051bc726834b22487fe2e236fe5
+RPI_FIRMWARE_VERSION = 940dc3b5ea0a001096c5fbb2d483a961d42fe85c
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.1.2
