From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Thu, 13 Aug 2015 18:22:48 +0200
Subject: [Buildroot] [PATCH 2/5] package/rpi-firmware: bump version
In-Reply-To: <1439482971-92878-1-git-send-email-benoit@wsystem.com>
References: <1439482971-92878-1-git-send-email-benoit@wsystem.com>
Message-ID: <1439482971-92878-3-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Misc enhancements and fixes all over the place, most notably:
 - FW: better overclocking, add Mediatek mt7601u Wi-Fi driver, bump
       kernel version to 4.1.5...
 - DT: fix SPI, I?S, gpio-poweroff, add MCP7941X, uart1, Fen Logic
       VGA666 board, RPi Sense HAT...
 - video: add early frame sequential 3D support, YUV_UV destination
          format, qpu deinterlace...

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 1ef15aa..2436376 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 856e2e1907a7f7058289c30268515c8cbf3fa5e3
+RPI_FIRMWARE_VERSION = 52f65ac4ad1ef1d2838fa2f921d5bc3ece4c777b
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.1.4
