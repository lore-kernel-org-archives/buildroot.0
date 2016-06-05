From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:55:59 +0200
Subject: [Buildroot] [PATCH 3/5] package/rpi-firmware: bump version, add hash
In-Reply-To: <1465163761-2848-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465163761-2848-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465163761-2848-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rpi-firmware/rpi-firmware.hash | 2 ++
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/rpi-firmware/rpi-firmware.hash

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
new file mode 100644
index 0000000..e2e31c9
--- /dev/null
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b2ce949db3745354383ac0d66107cbbb8902ccbf5fc027be8824519c44d5a302 rpi-firmware-70143fe9d371cd6486a80d6765e93b5574212b64.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index bcb8641..e170780 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = cc6d7bf8b4c03a2a660ff9fdf4083fc165620866
+RPI_FIRMWARE_VERSION = 70143fe9d371cd6486a80d6765e93b5574212b64
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.8.1
