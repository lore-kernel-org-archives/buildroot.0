From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  3 Oct 2016 09:23:33 -0300
Subject: [Buildroot] [PATCH 2/2] configs/orangepipc: Bump to U-Boot
	2016.09.01
In-Reply-To: <1475497413-27708-1-git-send-email-festevam@gmail.com>
References: <1475497413-27708-1-git-send-email-festevam@gmail.com>
Message-ID: <1475497413-27708-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot 2016.09.01 is a bugfix release, so bump to this version.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/orangepipc_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
index 1bea541..6d3a842 100644
--- a/configs/orangepipc_defconfig
+++ b/configs/orangepipc_defconfig
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.7.4
