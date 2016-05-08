From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 15:53:57 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version for rpi0
Message-ID: <20160508135714.66D39817FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fedfc08b2b4ab9ed4dc9b385a0928e8fa967ae8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although the current version of rpi-firmware we use is working just fine
on the rpi-zero, the latest firmware provides a DTB overlay to use the
USB OTG device in either host or slave modes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 96b10f4..bcb8641 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = c5e131971c323f5658c7c5d4b1dd105d37903a99
+RPI_FIRMWARE_VERSION = cc6d7bf8b4c03a2a660ff9fdf4083fc165620866
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
