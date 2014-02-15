From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Sat, 15 Feb 2014 13:45:52 -0300
Subject: [Buildroot] [PATCH 1/1] beaglebone: add DT for BeagleBone Black
Message-ID: <1392482752-4749-1-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The devicetree data for BeagleBone Black is the am335x?boneblack.dts file
(includes "am33xx.dtsi" and "am335x-bone-common.dtsi")

BeagleBone White uses the am335x-bone.dts file.

Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
 configs/beaglebone_defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 2996336..15220ed 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -36,4 +36,4 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"
-- 
1.7.10.4
