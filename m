From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 May 2016 15:50:01 +0200
Subject: [Buildroot] [PATCH 1/2] package/rpi-firmware: bump version for rpi0
In-Reply-To: <cover.1462715338.git.yann.morin.1998@free.fr>
References: <cover.1462715338.git.yann.morin.1998@free.fr>
Message-ID: <c473049d76cfdb524b1fcbdd05a6ce601d8ed5f4.1462715338.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although the current version of rpi-firmware we use is working just fine
on the rpi-zero, the latest firmware provides a DTB overlay to use the
USB OTG device in either host or slave modes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 96b10f4..bcb8641 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = c5e131971c323f5658c7c5d4b1dd105d37903a99
+RPI_FIRMWARE_VERSION = cc6d7bf8b4c03a2a660ff9fdf4083fc165620866
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.7.4
