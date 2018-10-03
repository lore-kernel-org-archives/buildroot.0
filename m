From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed,  3 Oct 2018 13:47:09 +0200
Subject: [Buildroot] [PATCH 2/2] configs/imx6ulevk: Bump u-boot to 2018.07
In-Reply-To: <20181003114709.8666-1-m.niestroj@grinn-global.com>
References: <20181003114709.8666-1-m.niestroj@grinn-global.com>
Message-ID: <20181003114709.8666-2-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 configs/imx6ulevk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx6ulevk_defconfig b/configs/imx6ulevk_defconfig
index d0cf8a6751..9e30d2c3c4 100644
--- a/configs/imx6ulevk_defconfig
+++ b/configs/imx6ulevk_defconfig
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ul_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-- 
2.19.0
