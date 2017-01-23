From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Jan 2017 21:23:17 +0100
Subject: [Buildroot] [PATCH v1 5/6] rpi-firmware: bump version
In-Reply-To: <20170123202318.12596-1-ps.report@gmx.net>
References: <20170123202318.12596-1-ps.report@gmx.net>
Message-ID: <20170123202318.12596-6-ps.report@gmx.net>
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
index 4d3b500af..8161d7aeb 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 3e84b3f58e3b978c4a90bb74713c349e99f203ff40f982a9acd8ebfdc256f3af rpi-firmware-2d5dc978b5a1a25f1c68666747e7585fabbcde2f.tar.gz
+sha256 144de63ee1999155fc1ff597630f1a13f798e597e7c4d144b8b625fa774c1f9b rpi-firmware-7f8ac8dac0b80291cbf5e56580139034a0a42070.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 2fd51d018..822252ad0 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 2d5dc978b5a1a25f1c68666747e7585fabbcde2f
+RPI_FIRMWARE_VERSION = 7f8ac8dac0b80291cbf5e56580139034a0a42070
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.11.0
