From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Oct 2017 21:54:15 +0200
Subject: [Buildroot] [PATCH 1/2] arm-trusted-firmware: fix comment typo
Message-ID: <20171012195416.5724-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 9bd3bfce6c..e02c62262f 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -49,7 +49,7 @@ define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release/*.bin $(BINARIES_DIR)/
 endef
 
-# Configuration ckeck
+# Configuration check
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR_BUILDING),yy)
 
 ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
-- 
2.11.0
