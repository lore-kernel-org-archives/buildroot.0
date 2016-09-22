From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 22 Sep 2016 23:47:11 +0200
Subject: [Buildroot] [PATCH v1] rpi-firmware: bump version
In-Reply-To: <1474580832-22406-1-git-send-email-ps.report@gmx.net>
References: <1474580832-22406-1-git-send-email-ps.report@gmx.net>
Message-ID: <1474580832-22406-6-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index e2e31c9..6dd2163 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b2ce949db3745354383ac0d66107cbbb8902ccbf5fc027be8824519c44d5a302 rpi-firmware-70143fe9d371cd6486a80d6765e93b5574212b64.tar.gz
+sha256 f7b649ac837a4a9c12a8f96962da310ca4efd6658621d89286b421b8784a4980 rpi-firmware-ad8608c08b122b2c228dba0ff5070d6e9519faf5.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 0587802..bf5c9dd 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 70143fe9d371cd6486a80d6765e93b5574212b64
+RPI_FIRMWARE_VERSION = ad8608c08b122b2c228dba0ff5070d6e9519faf5
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.8.1
