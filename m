From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Oct 2013 00:00:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/rpi-firmware: bump version
In-Reply-To: <cover.1380923923.git.yann.morin.1998@free.fr>
References: <cover.1380923923.git.yann.morin.1998@free.fr>
Message-ID: <5652961ba6bc7ca0914f8d406601a316f0548415.1380923923.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fix for issues with USB, audio, and GLESv2.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 9319429..ddb48b3 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = fadc4cb
+RPI_FIRMWARE_VERSION = e6b21d6
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.1.2
