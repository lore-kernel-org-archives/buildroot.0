From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Sep 2013 11:47:24 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version
Message-ID: <20130923074447.48D679B846@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3874e5cba9f062a620aa1fff13ad3673754d5c2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes for USB and audio; enable video capture.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 55c1ca4..9319429 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = d4f5315
+RPI_FIRMWARE_VERSION = fadc4cb
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
