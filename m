From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  4 Dec 2016 00:11:36 +0100
Subject: [Buildroot] [PATCH v1 5/6] rpi-firmware: bump version
In-Reply-To: <20161203231137.32221-1-ps.report@gmx.net>
References: <20161203231137.32221-1-ps.report@gmx.net>
Message-ID: <20161203231137.32221-6-ps.report@gmx.net>
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
index 6dd216330..4d3b500af 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f7b649ac837a4a9c12a8f96962da310ca4efd6658621d89286b421b8784a4980 rpi-firmware-ad8608c08b122b2c228dba0ff5070d6e9519faf5.tar.gz
+sha256 3e84b3f58e3b978c4a90bb74713c349e99f203ff40f982a9acd8ebfdc256f3af rpi-firmware-2d5dc978b5a1a25f1c68666747e7585fabbcde2f.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index bf5c9dd70..2fd51d018 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = ad8608c08b122b2c228dba0ff5070d6e9519faf5
+RPI_FIRMWARE_VERSION = 2d5dc978b5a1a25f1c68666747e7585fabbcde2f
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.11.0
