From: Martin Bark <martin@barkynet.com>
Date: Thu, 13 Jul 2017 13:22:26 +0100
Subject: [Buildroot] [PATCH 1/7] package/rpi-firmware: bump version
Message-ID: <1499948552-11324-1-git-send-email-martin@barkynet.com>
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
index 11655ee..db26c1e 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 84f44265c7e9bfe3e54a326b95ea7067870cfe08a9aae12f00aec8d47f6fc353 rpi-firmware-4b24a81a2ce94afd4458d1af4ea1e73d58e69848.tar.gz
+sha256 42edea8317869f5a5ed87dfe009ceffce6a784ff40cb5da3e9e8a4fc61d79610 rpi-firmware-685b3ceb0a6d6d6da7b028ee409850e83fb7ede7.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 134fceb..0afdc87 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 4b24a81a2ce94afd4458d1af4ea1e73d58e69848
+RPI_FIRMWARE_VERSION = 685b3ceb0a6d6d6da7b028ee409850e83fb7ede7
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.7.4
