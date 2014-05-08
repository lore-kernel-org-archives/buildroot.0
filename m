From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  8 May 2014 23:11:00 +0200
Subject: [Buildroot] [PATCH 1/3] package/rpi-firmware: bump
In-Reply-To: <cover.1399583377.git.yann.morin.1998@free.fr>
References: <cover.1399583377.git.yann.morin.1998@free.fr>
Message-ID: <48bcaed707ac8aa4c599b8a5569a776dad80415d.1399583377.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Undocumented changes (probably related to HDMI).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.3.2
