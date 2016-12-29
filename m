From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 28 Dec 2016 22:57:19 -0200
Subject: [Buildroot] [PATCH] configs/warp7: Add floating point support
Message-ID: <1482973039-13599-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/warp7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 2d59626..90a7338 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -1,6 +1,7 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 4.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-- 
2.7.4
