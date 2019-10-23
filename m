From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 23 Oct 2019 17:04:37 +0300
Subject: [Buildroot] [PATCH] configs/snps_hsdk: Switch to archs38_full CPU
 option
Message-ID: <20191023140437.37445-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lets switch CPU option to archs38_full for HSDK to 
get an increase in performance by using FPU extensions.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
 configs/snps_archs38_hsdk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 0fc708eee1..646cd99d99 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,6 +1,6 @@
 # Architecture
 BR2_arcle=y
-BR2_archs38=y
+BR2_archs38_full=y
 
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-- 
2.16.2
