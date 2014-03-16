From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Mar 2014 21:24:35 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version
Message-ID: <20140316205026.344849BFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f76708fd046ce45fc91573d4280544e8314bce6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump for misc fixes and enhancements:
  - firmware: smaller cut-down (aka rescue) firmware
  - audio: sample rates, float samples, any-number-of-channels
  - hdmi: fix for (high?) output rates
  - video: h264 decode when changing resolution
  - camera: high frame rates, full FoV

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index a849d32..5bc65ff 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = a0eb06736a3f1583fc6cd575149c7835dc43582d
+RPI_FIRMWARE_VERSION = 089cfb05ec350505ee84a99d567474c5bdc0505e
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
