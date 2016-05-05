From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 May 2016 12:30:30 -0300
Subject: [Buildroot] [PATCH 3/3] configs/freescale_mpc8315erdb: bump to
	kernel 4.5.3
In-Reply-To: <1462462230-30078-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462462230-30078-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1462462230-30078-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../freescale/mpc8315erdb/{linux-4.2.config => linux-4.5.config}  | 0
 configs/freescale_mpc8315erdb_defconfig                           | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename board/freescale/mpc8315erdb/{linux-4.2.config => linux-4.5.config} (100%)

diff --git a/board/freescale/mpc8315erdb/linux-4.2.config b/board/freescale/mpc8315erdb/linux-4.5.config
similarity index 100%
rename from board/freescale/mpc8315erdb/linux-4.2.config
rename to board/freescale/mpc8315erdb/linux-4.5.config
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index b931471..628aaad 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -10,15 +10,15 @@ BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x200
 BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x4000
 BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 
-# Linux headers same as kernel, a 4.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-4.5.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="mpc8315erdb"
-- 
2.7.3
