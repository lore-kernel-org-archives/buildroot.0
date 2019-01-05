From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  5 Jan 2019 20:50:57 +0100
Subject: [Buildroot] [PATCH v1 2/3] rpi-firmware: bump version to fbad6408c4
In-Reply-To: <20190105195058.7322-1-ps.report@gmx.net>
References: <20190105195058.7322-1-ps.report@gmx.net>
Message-ID: <20190105195058.7322-3-ps.report@gmx.net>
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
index 728c53fe9a..b74991db78 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 57c56e9e41a2d9b1ce660aa7887db5c4b44f768fc63c6b6ef1d2fe460a090d85 rpi-firmware-fbad6408c4596d3d671736ee0571aae444f24e68.tar.gz
+sha256 58dc9d1080582964943b509ed9444602ce7fb50c1124199d3f06a5b121aa0706 rpi-firmware-e1bd9b0b8cda901ee9b23cbb8b3334cde71320a7.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index bb54904ae6..70985880e9 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = fbad6408c4596d3d671736ee0571aae444f24e68
+RPI_FIRMWARE_VERSION = e1bd9b0b8cda901ee9b23cbb8b3334cde71320a7
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.20.1
