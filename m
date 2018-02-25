From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:18:14 +0100
Subject: [Buildroot] [git commit branch/next] sunxi-mali-mainline-driver:
 bump version
Message-ID: <20180225211832.2111D88150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14b7b8ac50eaef8b09920c75d5dcfc196764b6db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For 4.16 support.

git shortlog --invert-grep --grep travis --no-merges e752ddc8c4b9f2b9b9c6d193e2ba354caf8707f5..
Giulio Benetti (1):
      mali: Fix build in 4.16

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index cde76e2655..24e759aaa7 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = e752ddc8c4b9f2b9b9c6d193e2ba354caf8707f5
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = 94ccbc8924c12a818d61d36a4b389b74a89fde3c
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 
