From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Nov 2013 23:55:18 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: bump
Message-ID: <20131105231347.7D07A7F922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c16b7bf306dd2954896a88c18004a18d713a4659
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Further fixes for de-interlacing.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index a7574f2..e6763af 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 58036da500d936a98156d703fa220dc7db175762
+RPI_FIRMWARE_VERSION = 5343d029a5f2f09bd9801914eac0d4bf95cadc1f
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
