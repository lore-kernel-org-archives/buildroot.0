From: Martin Bark <martin@barkynet.com>
Date: Thu, 15 Mar 2018 13:24:48 +0000
Subject: [Buildroot] [PATCH 1/4] package/rpi-firmware: bump version
Message-ID: <1521120291-15781-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 833a7fb..0e09ff5 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0451e1a843bf02df81126a1625d9a15dfdf19dcb2f9e95b0613a63e59fd31ca8 rpi-firmware-2067241bc7cdf238fdeab7f5a3c22faa57dd5617.tar.gz
+sha256 8fe5ebe14cc900f67242cab0c1c9f8e29bd10369ccbdfc7d004c294a96bad975 rpi-firmware-086a8488de0f485e8879ac14ff505ff1d922eeed.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 22eaaa2..1ebdd96 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 2067241bc7cdf238fdeab7f5a3c22faa57dd5617
+RPI_FIRMWARE_VERSION = 086a8488de0f485e8879ac14ff505ff1d922eeed
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.7.4
