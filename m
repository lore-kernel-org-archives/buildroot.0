From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 29 Dec 2016 10:43:34 -0200
Subject: [Buildroot] [PATCH 2/3] configs/imx6ulpico: Select floating point
In-Reply-To: <1483015415-8998-1-git-send-email-festevam@gmail.com>
References: <1483015415-8998-1-git-send-email-festevam@gmail.com>
Message-ID: <1483015415-8998-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6ulpico_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 60de7d7..f7f7f20 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -1,6 +1,7 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 4.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-- 
2.7.4
