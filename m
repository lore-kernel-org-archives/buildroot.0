From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Jun 2019 13:57:32 +0200
Subject: [Buildroot] [PATCH 3/4] amarula_vyasa_rk3288_defconfig: use
 same-as-kernel option for kernel headers
In-Reply-To: <20190618115733.28551-1-peter@korsgaard.com>
References: <20190618115733.28551-1-peter@korsgaard.com>
Message-ID: <20190618115733.28551-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of the to-be-removed 5.0 option.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/amarula_vyasa_rk3288_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 6fd46b6455..760ad3f9f4 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -4,7 +4,7 @@ BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 5.0 series
-BR2_KERNEL_HEADERS_5_0=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-- 
2.11.0
