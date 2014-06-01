From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 23:12:16 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump
Message-ID: <20140601211459.E43529CE00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ecfd6b9c3007175f837348e75a927fe98861d6a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Yet another bump for the Raspberry Pi firmware:
  - HDMI: EDID override; HDCP fix; add command to control power to HDMI phy;
        fixes to mode selection
  - GPU: enable use of HW cursor; fix for GLES FFT compliance; fix scaling;
        remove arbitrary restrictions on output sizes
  - video-decode: better handle corrupted h264 streams, better allocate memory
  - misc: choose composite video when HDMI is not plugged

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index babb0a8..ca9b5eb 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = c8881991d9181779aee9637d6f4b215f108021a3
+RPI_FIRMWARE_VERSION = f15c3b5e4018b974de30d95d3173b1e936f66bd7
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
