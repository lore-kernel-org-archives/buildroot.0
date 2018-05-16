From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 May 2018 00:10:53 -0300
Subject: [Buildroot] [PATCH] configs/mx53loco: Adjust comment to reflect the
 real kernel version
Message-ID: <1526440253-838-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The kernel used is from 4.16 version, so adjust the comment.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx53loco_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 16dde35..ae56fca 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -2,7 +2,7 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 4.15 series
+# Linux headers same as kernel, a 4.16 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # System
-- 
2.7.4
