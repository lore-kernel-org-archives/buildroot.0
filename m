From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 22:59:08 +0100
Subject: [Buildroot] [git commit] rpi-firmware: bump version
Message-ID: <20170123220845.33B84805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14b8ad175da731113c285ca83855341a765c6364
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 4d3b500..8161d7a 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 3e84b3f58e3b978c4a90bb74713c349e99f203ff40f982a9acd8ebfdc256f3af rpi-firmware-2d5dc978b5a1a25f1c68666747e7585fabbcde2f.tar.gz
+sha256 144de63ee1999155fc1ff597630f1a13f798e597e7c4d144b8b625fa774c1f9b rpi-firmware-7f8ac8dac0b80291cbf5e56580139034a0a42070.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 2fd51d0..822252a 100644
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
