From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Jan 2019 21:18:13 +0100
Subject: [Buildroot] [git commit] rpi-firmware: bump version to fbad6408c4
Message-ID: <20190106201944.1D8C789104@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a5fb2ad1c5404e6e1bd47777a0aec32d07fded4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
