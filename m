From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:27:50 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: bump revision
Message-ID: <20140329173147.28E579C42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea442b18ec540c337ec7c511466accad2c6bb1b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes in firmware:
  - misc: SDRAM calibration
  - camera: burst performance, exposure, EXIF
  - audio: noise in multichannel output, 8-bit input, float input/output,
           non-power-of-2 multi-channel
  - video: SEI in h264 encoder

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 5bc65ff..06fd194 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 089cfb05ec350505ee84a99d567474c5bdc0505e
+RPI_FIRMWARE_VERSION = 9c7c2cd698ae24022c7aa74b16436c2966e82624
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
