From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 10 Jan 2019 21:37:44 +0100
Subject: [Buildroot] [PATCH] package/sunxi-mali-mainline-driver: bump version
Message-ID: <20190110203744.2848-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For 4.20 support.

git shortlog --invert-grep --grep travis --no-merges 143ff2b17de63ce931c4f758771969e75c09a4c7..
Roman Stratiienko (1):
      mali: support building against 4.20

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index c7f294cbf4..a77ee91f7e 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = 143ff2b17de63ce931c4f758771969e75c09a4c7
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = e28c274f85c65ebec82cdf0f8d021895e105d917
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
-- 
2.17.1
