From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 21:26:45 +0100
Subject: [Buildroot] [git commit] rpi-firmware: version bump
Message-ID: <20160201224700.252227F918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38172747f8a6d2640dcd9290f7c2ef7e5ad8dd3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To match the previous kernel version bump.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 2436376..4b92a50 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 52f65ac4ad1ef1d2838fa2f921d5bc3ece4c777b
+RPI_FIRMWARE_VERSION = 22d8c910f4c53118f9cf85c038d7d8e307efc110
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
