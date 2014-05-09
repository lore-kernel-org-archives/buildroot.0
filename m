From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 May 2014 16:29:43 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump
Message-ID: <20140509143213.EEB839CB24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=510f088d01438ae75495913bbb3862ad6870b84f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Undocumented changes (probably related to HDMI).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 138c37d..babb0a8 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 81e54c47b1cb26dd3990cbc970f4ddd3614196e8
+RPI_FIRMWARE_VERSION = c8881991d9181779aee9637d6f4b215f108021a3
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
