From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jul 2013 15:13:24 +0200
Subject: [Buildroot] [PATCH 1/3] package/rpi-firmware: bump version
In-Reply-To: <cover.1373202515.git.yann.morin.1998@free.fr>
References: <cover.1373202515.git.yann.morin.1998@free.fr>
Message-ID: <45d5ab06a5965194fd97f7c2050688010ba949e3.1373202515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes for:
  - sound volume
  - GL deadlock
  - ressources leak
  - compressed audio streams
  - audio sampling up to 192kHz
  - display scaling
  - cache flush for mailbox

Switch to using a 7-char cset, instead of the long one.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index b490296..6ea621f 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = a0c98fa6bc0f93bad8cbfcf749f7be7dc2276192
+RPI_FIRMWARE_VERSION = 320084a
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.1.2
