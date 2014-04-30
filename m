From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Apr 2014 09:11:51 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump for
	enhancements and bug fixes
Message-ID: <20140430071330.AB0719CA93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49009bb5ea904ff9e3e80f4dbd4ec85608b1b75e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes and enhancements for:
  - video: add 3D stereo, unusual streams with skipped frames
  - audio: reset-on-flush, alsa passthrough, volume
  - misc : SDRAM drive strength
  - some undocumented changes

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 1c85b83..138c37d 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 04ba1c03780ae708c9289bce14f56933e55e9c20
+RPI_FIRMWARE_VERSION = 81e54c47b1cb26dd3990cbc970f4ddd3614196e8
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
