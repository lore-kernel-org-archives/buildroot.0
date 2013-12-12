From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2013 00:01:27 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: bump
Message-ID: <20131212230221.B34509BFED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e19f7f759372a7dfea8e4518c76b58a9a1a682ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bumps gets us:
  - support for the v4l2 driver
  - fix latencies in vdec3 (h264 decoder)
  - fix incorrect frame presentation in de-interlacing filter

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 838952b..664f6ad 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = f7e9bcd25c9b01521fdf88aac2740b6cfc887dfb
+RPI_FIRMWARE_VERSION = e618d4ff2dc20051bc726834b22487fe2e236fe5
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
