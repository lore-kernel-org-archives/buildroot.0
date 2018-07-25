From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 25 Jul 2018 12:07:03 +0200
Subject: [Buildroot] [PATCH 4/5] sunxi-mali-mainline-driver: bump version
In-Reply-To: <20180725100704.71349-1-giulio.benetti@micronovasrl.com>
References: <20180725100704.71349-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180725100704.71349-5-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For support H3 and H5 SoCs and r8p1 driver version.

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
index 24817b07c7..fcaeb81efe 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = 52ef1c5e133cc5fd791ca636239dc5e7b19c26d5
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = 8e6b7d25b13089d53dbfc1ebd9e8737b0dc809cb
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 
-- 
2.17.1
