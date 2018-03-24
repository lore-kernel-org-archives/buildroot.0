From: Martin Bark <martin@barkynet.com>
Date: Sat, 24 Mar 2018 14:10:11 +0000
Subject: [Buildroot] [PATCH v4 1/7] package/rpi-firmware: bump version
In-Reply-To: <1521900617-32102-1-git-send-email-martin@barkynet.com>
References: <1521900617-32102-1-git-send-email-martin@barkynet.com>
Message-ID: <1521900617-32102-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

----
Changes v3 -> v4:
 - update to latest

Changes v2 -> v3:
 - none

Changes v1 -> v2:
 - none
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 833a7fb..4854dea 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0451e1a843bf02df81126a1625d9a15dfdf19dcb2f9e95b0613a63e59fd31ca8 rpi-firmware-2067241bc7cdf238fdeab7f5a3c22faa57dd5617.tar.gz
+sha256 ea451834e20136d249661e0ed7d1fdfa309249d233a387f44dd6c3b746a454c6 rpi-firmware-36f991382326907419f64917624427e59fd8e4a0.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 22eaaa2..1f4a168 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 2067241bc7cdf238fdeab7f5a3c22faa57dd5617
+RPI_FIRMWARE_VERSION = 36f991382326907419f64917624427e59fd8e4a0
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.7.4
