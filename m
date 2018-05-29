From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 29 May 2018 23:22:19 +0200
Subject: [Buildroot] [PATCH v3 4/4] configs: add linux boot logo to
 raspberrypi3 defconfig
In-Reply-To: <1527628939-7389-1-git-send-email-angelo@amarulasolutions.com>
References: <1527628939-7389-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1527628939-7389-5-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch adds a custom boot up logo to the raspberrypi3
defconfig.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 configs/raspberrypi3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 45a76be..ed3d28d 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -13,6 +13,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,c117a8bccf37bfba323065b566cf999ed4629a4a)/linux-c117a8bccf37bfba323065b566cf999ed4629a4a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+BR2_LINUX_KERNEL_CUSTOMLOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.7.4
