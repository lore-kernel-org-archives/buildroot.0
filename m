From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 13 Mar 2018 17:08:08 +0100
Subject: [Buildroot] [PATCH] sunxi-mali-mainline-driver: bump version
Message-ID: <1520957288-107199-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For stop using cma.

git shortlog --invert-grep --grep travis --no-merges 94ccbc8924c12a818d61d36a4b389b74a89fde3c..
Maxime Ripard (1):
      mali: Stop using the reserved-memory region to setup the fb area

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index 24e759a..24817b0 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = 94ccbc8924c12a818d61d36a4b389b74a89fde3c
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = 52ef1c5e133cc5fd791ca636239dc5e7b19c26d5
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 
-- 
2.7.4
