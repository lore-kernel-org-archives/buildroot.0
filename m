From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  2 May 2021 11:48:26 +0200
Subject: [Buildroot] [PATCH v1 2/5] package/rpi-firmware: bump version to
 1a46874
In-Reply-To: <20210502094829.8292-1-ps.report@gmx.net>
References: <20210502094829.8292-1-ps.report@gmx.net>
Message-ID: <20210502094829.8292-2-ps.report@gmx.net>
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
index 691b200259..ff2b7495c6 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae4e317681995e0f7becd7900ae667cba394e3a0b7ca93a267f3303df7284697  rpi-firmware-d016a6eb01c8c7326a89cb42809fed2a21525de5.tar.gz
+sha256  ac4e6bd0741e2cb1b99042af12c3ef4adc00ba9c9147cdd91b1ae4faf0928952  rpi-firmware-1a46874494146f470d7a61b0b6f4f15a07dd8b35.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index f3d28ef825..f3bda830be 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = d016a6eb01c8c7326a89cb42809fed2a21525de5
+RPI_FIRMWARE_VERSION = 1a46874494146f470d7a61b0b6f4f15a07dd8b35
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.31.1
