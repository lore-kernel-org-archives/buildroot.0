From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:19:11 +0200
Subject: [Buildroot] [git commit] configs/freescale_mpc8315erdb: bump to
	kernel 4.5.3
Message-ID: <20160505201945.7E9647F8AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23cc2cfbf9d288d7662ca4b19edfef947af14fcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../freescale/mpc8315erdb/{linux-4.2.config => linux-4.5.config}  | 0
 configs/freescale_mpc8315erdb_defconfig                           | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)

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
