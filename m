From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Jan 2015 14:49:55 -0300
Subject: [Buildroot] [PATCH] configs/p1010rdb: bump to kernel 3.18.1
Message-ID: <1420566595-25849-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/freescale/p1010rdb/{linux-3.17.config => linux-3.18.config} | 0
 configs/freescale_p1010rdb_pa_defconfig                           | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename board/freescale/p1010rdb/{linux-3.17.config => linux-3.18.config} (100%)

diff --git a/board/freescale/p1010rdb/linux-3.17.config b/board/freescale/p1010rdb/linux-3.18.config
similarity index 100%
rename from board/freescale/p1010rdb/linux-3.17.config
rename to board/freescale/p1010rdb/linux-3.18.config
diff --git a/configs/freescale_p1010rdb_pa_defconfig b/configs/freescale_p1010rdb_pa_defconfig
index b784f39..ff5ee06 100644
--- a/configs/freescale_p1010rdb_pa_defconfig
+++ b/configs/freescale_p1010rdb_pa_defconfig
@@ -11,15 +11,15 @@ BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x20000
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.17.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.18.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="p1010rdb-pa"
-- 
2.0.5
