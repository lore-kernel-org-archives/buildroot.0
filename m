From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  9 Feb 2012 15:51:47 +0100
Subject: [Buildroot] [PATCH 1/2] u-boot: begin custom patch dir with a
	capital
Message-ID: <1328799108-19521-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 boot/uboot/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c8db9fb..b10d380 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -55,7 +55,7 @@ config BR2_TARGET_UBOOT_VERSION
 	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
-	string "custom patch dir"
+	string "Custom patch dir"
 	help
 	  If your board requires custom patches, add the path to the
 	  directory containing the patches here. The patches must be
-- 
1.7.5.4
