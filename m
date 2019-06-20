From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jun 2019 13:27:17 +0200
Subject: [Buildroot] [git commit] amarula_vyasa_rk3288_defconfig: use
 same-as-kernel option for kernel headers
Message-ID: <20190620113223.F0147821C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b769e54a92fe71b01fd5a899ccf60af668d8a60d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
