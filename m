From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Sat,  2 Jun 2018 12:05:59 +0300
Subject: [Buildroot] [PATCH] configs/snps_archs38_hsdk: bump linux version
 to 4.14.47
Message-ID: <20180602090559.32331-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch updates Linux kernel version to 4.14.47 for HSDK board.

Fixes:
 https://gitlab.com/buildroot.org/buildroot/-/jobs/71727022

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: arc-buildroot at synopsys.com
---
 configs/snps_archs38_hsdk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 125063b444..415759ac36 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -13,7 +13,7 @@ BR2_SYSTEM_DHCP="eth0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.47"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
 
-- 
2.16.2
