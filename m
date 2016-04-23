From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 23 Apr 2016 18:46:21 +0200
Subject: [Buildroot] [PATCH v1 1/4] rpi-firmware: bump version
In-Reply-To: <1461429984-12561-1-git-send-email-ps.report@gmx.net>
References: <1461429984-12561-1-git-send-email-ps.report@gmx.net>
Message-ID: <1461429984-12561-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 8476678..cbacacd 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 951799bbcd795ddf27769d14acf4813fdcbe53dc
+RPI_FIRMWARE_VERSION = c5e131971c323f5658c7c5d4b1dd105d37903a99
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.1.4
