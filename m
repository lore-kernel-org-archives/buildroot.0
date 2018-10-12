From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 12 Oct 2018 23:09:38 +0200
Subject: [Buildroot] [PATCH v1 2/5] rpi-firmware: bump version to fbad6408c4
In-Reply-To: <20181012210941.21515-1-ps.report@gmx.net>
References: <20181012210941.21515-1-ps.report@gmx.net>
Message-ID: <20181012210941.21515-3-ps.report@gmx.net>
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
index d481ee524f..728c53fe9a 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5edff641f216d2e09c75469dc2e9fc66aff290e212a1cd43ed31c499f99ea055 rpi-firmware-287af2a2be0787a5d45281d1d6183a2161c798d4.tar.gz
+sha256 57c56e9e41a2d9b1ce660aa7887db5c4b44f768fc63c6b6ef1d2fe460a090d85 rpi-firmware-fbad6408c4596d3d671736ee0571aae444f24e68.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 853ab6ed02..bb54904ae6 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 287af2a2be0787a5d45281d1d6183a2161c798d4
+RPI_FIRMWARE_VERSION = fbad6408c4596d3d671736ee0571aae444f24e68
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.19.0
