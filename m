From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 10:20:52 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: Bump version to
	kernel 3.12.25
Message-ID: <20140803083010.283AE9D37B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16c453f41392de78ccae013ac8c382db830c97ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version bump, amongst other things, introduces
OMX_ImageFilterDeInterlaceFast, which is needed by
the upcoming xbmc/kodi version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index ca9b5eb..49b4661 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = f15c3b5e4018b974de30d95d3173b1e936f66bd7
+RPI_FIRMWARE_VERSION = 16ebc76904699b036f709beb65ee5ff70f83190b
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
