From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 22:24:16 +0100
Subject: [Buildroot] [PATCH 4/5] package/rpi-firmware: bump version
In-Reply-To: <cover.1394486562.git.yann.morin.1998@free.fr>
References: <cover.1394486562.git.yann.morin.1998@free.fr>
Message-ID: <1341a394a1d2478084278cb1f6384d4aa726ab53.1394486562.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump to latest changeset:
  - fix for detecting monitor

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index b6c9667..a849d32 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = bec4bd0f70aa46f55a980996e8774547c0f909c8
+RPI_FIRMWARE_VERSION = a0eb06736a3f1583fc6cd575149c7835dc43582d
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.3.2
