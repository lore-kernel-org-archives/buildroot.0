From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Sep 2013 15:45:24 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version
Message-ID: <20130905134646.AD4FA8B3A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9260ebf765367498c6f03f4b84cdb25fe0419d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes and improvements for USB, audio sync, camera support,
codecs, HDMI framerate and audio, and GPU freezes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 6ea621f..55c1ca4 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 320084a
+RPI_FIRMWARE_VERSION = d4f5315
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
