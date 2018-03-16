From: Martin Bark <martin@barkynet.com>
Date: Fri, 16 Mar 2018 18:02:26 +0000
Subject: [Buildroot] [PATCH v3 1/7] package/rpi-firmware: bump version
In-Reply-To: <20180316180232.18829-1-martin@barkynet.com>
References: <20180316180232.18829-1-martin@barkynet.com>
Message-ID: <20180316180232.18829-2-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

----
Changes v1 -> v2:
 - none

Changes v2 -> v3:
 - none
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 833a7fbe37..0e09ff50b4 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0451e1a843bf02df81126a1625d9a15dfdf19dcb2f9e95b0613a63e59fd31ca8 rpi-firmware-2067241bc7cdf238fdeab7f5a3c22faa57dd5617.tar.gz
+sha256 8fe5ebe14cc900f67242cab0c1c9f8e29bd10369ccbdfc7d004c294a96bad975 rpi-firmware-086a8488de0f485e8879ac14ff505ff1d922eeed.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 22eaaa2886..1ebdd96718 100644
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
2.16.2
