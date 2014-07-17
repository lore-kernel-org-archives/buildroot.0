From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Thu, 17 Jul 2014 16:23:42 +0200
Subject: [Buildroot] [PATCH] pandaboard: remove use of gcc 4.6.x
Message-ID: <1405607022-18746-1-git-send-email-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gcc 4.6.x is legacy now; remove version specification from the config file to
repair the build.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
---
 configs/pandaboard_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 401a602..50c3714 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -28,9 +28,6 @@ BR2_LINUX_KERNEL_USE_INTREE_DTS=y
 # might need omap4-panda or omap4-panda-a4 instead
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es"
 
-# GCC
-BR2_GCC_VERSION_4_6_X=y
-
 # Bootloaders
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.0.1
