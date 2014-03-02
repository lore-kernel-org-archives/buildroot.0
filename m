From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 21:00:15 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version
Message-ID: <20140302200035.2392F9936B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d6ebaf644c54343cb6d3fcc8159cc76cf56a56e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes and enhancements for:
  - audio: clock, HDMI passthrough, DTS
  - video playback: unpacked bitstreams
  - 3D: HW textures orientation
  - PWM: boot-time options
  - undisclosed changes

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 99faa5b..b6c9667 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 98e3be3a7e0ec7d4a86e8edb2177bd8e2bb8728f
+RPI_FIRMWARE_VERSION = bec4bd0f70aa46f55a980996e8774547c0f909c8
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
