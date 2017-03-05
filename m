From: Martin Bark <martin@barkynet.com>
Date: Sun,  5 Mar 2017 16:06:13 +0000
Subject: [Buildroot] [PATCH 5/8] package/rpi-firmware: bump version
In-Reply-To: <1488729976-7116-1-git-send-email-martin@barkynet.com>
References: <1488729976-7116-1-git-send-email-martin@barkynet.com>
Message-ID: <1488729976-7116-5-git-send-email-martin@barkynet.com>
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
index 8161d7a..f6dd03a 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 144de63ee1999155fc1ff597630f1a13f798e597e7c4d144b8b625fa774c1f9b rpi-firmware-7f8ac8dac0b80291cbf5e56580139034a0a42070.tar.gz
+sha256 0797a034b33a0218fd6fb3c5bb1473959e209a8fe676f3c215f954806601aa78 rpi-firmware-78c4983379de0537f49a97fb37ceaaf42632b28c.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index d2cd481..b73ef53 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 7f8ac8dac0b80291cbf5e56580139034a0a42070
+RPI_FIRMWARE_VERSION = 78c4983379de0537f49a97fb37ceaaf42632b28c
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.7.4
