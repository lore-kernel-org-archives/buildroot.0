From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  3 Jul 2021 23:13:12 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/rpi-firmware: bump version to
 0e5a49e
In-Reply-To: <20210703211313.19364-1-ps.report@gmx.net>
References: <20210703211313.19364-1-ps.report@gmx.net>
Message-ID: <20210703211313.19364-2-ps.report@gmx.net>
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
index ff2b7495c6..2abc920161 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ac4e6bd0741e2cb1b99042af12c3ef4adc00ba9c9147cdd91b1ae4faf0928952  rpi-firmware-1a46874494146f470d7a61b0b6f4f15a07dd8b35.tar.gz
+sha256  3ce2105247a91ffa86d317e7810e110b601a094d6781a219996d8bc9fbe98c6f  rpi-firmware-0e5a49eb2f7f066876c69cf5fe61625fb5c32f67.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index f3bda830be..829f265c8e 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 1a46874494146f470d7a61b0b6f4f15a07dd8b35
+RPI_FIRMWARE_VERSION = 0e5a49eb2f7f066876c69cf5fe61625fb5c32f67
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.32.0
