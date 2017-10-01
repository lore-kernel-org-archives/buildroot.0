From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun,  1 Oct 2017 15:42:41 +0200
Subject: [Buildroot] [PATCH 1/2] bananapro: bump U-Boot to version 2017.09
Message-ID: <20171001134242.8053-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 configs/bananapro_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index 538e3e2ac6..c0a2b07dd9 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -39,7 +39,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.14.2
