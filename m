From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:07:00 +0200
Subject: [Buildroot] [git commit] rpi-firmware: bump version
Message-ID: <20160421201205.4109D81E91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1438d52eb529cc0e782c05271b64ec3002223373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps the rpi-firmware to a more recent version that
includes support for the Raspberry Pi 3.

Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
[Thomas: tweak commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 291da3a..8476678 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 8b4e5482b52e6fb438dddc0d88ba0ba8d44af54b
+RPI_FIRMWARE_VERSION = 951799bbcd795ddf27769d14acf4813fdcbe53dc
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
