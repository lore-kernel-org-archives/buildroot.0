From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 14 May 2019 11:42:46 +0200
Subject: [Buildroot] [PATCH 2/4] configs/liteboard: bump U-Boot to 2019.04
In-Reply-To: <20190514094248.4893-1-m.niestroj@grinn-global.com>
References: <20190514094248.4893-1-m.niestroj@grinn-global.com>
Message-ID: <20190514094248.4893-2-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 configs/grinn_liteboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
index 09656331e5..f2c1da33e3 100644
--- a/configs/grinn_liteboard_defconfig
+++ b/configs/grinn_liteboard_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="liteboard"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.21.0
