From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Aug 2013 22:42:21 +0200
Subject: [Buildroot] [git commit] configs/mpc8315erdb: bump to the latest
	and greatest versions
Message-ID: <20130827210259.E92F69B3E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e4068a3301b9bc1fbc43bfd12e5c5c4b22982ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.8.config => linux-3.10.config}        |    0
 configs/freescale_mpc8315erdb_defconfig            |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/freescale/mpc8315erdb/linux-3.8.config b/board/freescale/mpc8315erdb/linux-3.10.config
similarity index 100%
rename from board/freescale/mpc8315erdb/linux-3.8.config
rename to board/freescale/mpc8315erdb/linux-3.10.config
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index d32264e..12bb70e 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -16,9 +16,9 @@ BR2_KERNEL_HEADERS_3_8=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-3.10.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="mpc8315erdb"
@@ -31,4 +31,4 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="MPC8315ERDB_NAND"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.07"
