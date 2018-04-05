From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  5 Apr 2018 10:22:49 +0200
Subject: [Buildroot] [PATCH 2/2] configs/bananapro: bump U-Boot to version
 2018.03
In-Reply-To: <20180405082249.22327-1-joerg.krause@embedded.rocks>
References: <20180405082249.22327-1-joerg.krause@embedded.rocks>
Message-ID: <20180405082249.22327-2-joerg.krause@embedded.rocks>
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
index c6473be3ae..b4141e3608 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -39,7 +39,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.16.3
