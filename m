From: Martin Bark <martin@barkynet.com>
Date: Fri, 14 Apr 2017 16:32:24 +0100
Subject: [Buildroot] [PATCH 1/6] package/rpi-firmware: bump version
Message-ID: <1492183949-8181-1-git-send-email-martin@barkynet.com>
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
index f6dd03a..11655ee 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0797a034b33a0218fd6fb3c5bb1473959e209a8fe676f3c215f954806601aa78 rpi-firmware-78c4983379de0537f49a97fb37ceaaf42632b28c.tar.gz
+sha256 84f44265c7e9bfe3e54a326b95ea7067870cfe08a9aae12f00aec8d47f6fc353 rpi-firmware-4b24a81a2ce94afd4458d1af4ea1e73d58e69848.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 5d5c9f0..134fceb 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 78c4983379de0537f49a97fb37ceaaf42632b28c
+RPI_FIRMWARE_VERSION = 4b24a81a2ce94afd4458d1af4ea1e73d58e69848
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.7.4
