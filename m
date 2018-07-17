From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 17 Jul 2018 18:07:25 +0200
Subject: [Buildroot] [PATCH] sunxi-mali-mainline-driver: bump version
Message-ID: <20180717160725.51894-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For support H3 and H5 SoCs.

git shortlog --invert-grep --grep travis --no-merges 52ef1c5e133cc5fd791ca636239dc5e7b19c26d5..
Maxime Ripard (6):
      Add r8p1 release
      sunxi: Move the reset test to a function
      sunxi: Add H3 support
      sunxi: Add H5 support
      sunxi: Remove generic compatible
      sunxi: Set clock rate in the driver

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index 24817b07c7..30a922e45c 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = 52ef1c5e133cc5fd791ca636239dc5e7b19c26d5
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = d57a0b07c5c1e30b0a5dc41cc13819fab5099336
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 
-- 
2.17.1
