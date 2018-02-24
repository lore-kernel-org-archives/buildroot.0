From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 24 Feb 2018 13:25:57 +0100
Subject: [Buildroot] [PATCH] sunxi-mali-mainline-driver: bump version
Message-ID: <1519475157-63049-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For 4.16 support.

git shortlog --invert-grep --grep travis --no-merges e752ddc8c4b9f2b9b9c6d193e2ba354caf8707f5..
Giulio Benetti (1):
      mali: Fix build in 4.16

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index cde76e2..24e759a 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = e752ddc8c4b9f2b9b9c6d193e2ba354caf8707f5
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = 94ccbc8924c12a818d61d36a4b389b74a89fde3c
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 
-- 
2.7.4
