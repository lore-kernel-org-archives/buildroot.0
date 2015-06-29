From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 22:16:39 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version
Message-ID: <20150629202339.E0E0380F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=465a039f82ecd3411553419c72a509b222e21903
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Misc enhancements and fixes all over the place, most notably:
  - FW: fix overclocking, better prioritise sound, fix CMA L1 cache,
        improved DTB/DTB-overlay support, SDcard freq fixes,
        voltages...
  - video: fix decoding weird stuff, fix stereo output...
  - camera: raw image capture, HDR (really?)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 0533588..56d6925 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = b9fac65dd9ff607d0c2c4ea1bbba2bbf3fbc4a10
+RPI_FIRMWARE_VERSION = 856e2e1907a7f7058289c30268515c8cbf3fa5e3
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
