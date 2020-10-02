From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  2 Oct 2020 17:59:55 +0200
Subject: [Buildroot] [PATCH 2/3] configs/mx6config: switch uboot to Kconfig
 build system
In-Reply-To: <20201002155956.18228-1-francois.perrad@gadz.org>
References: <20201002155956.18228-1-francois.perrad@gadz.org>
Message-ID: <20201002155956.18228-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/mx6cubox_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index 18e06fea8..3c45198ce 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -30,9 +30,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 
 # Bootloaders
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6cuboxi"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-- 
2.25.1
