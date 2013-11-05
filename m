From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Nov 2013 23:55:06 +0100
Subject: [Buildroot] [git commit] configs/p1010rdb: bump to the latest and
	greatest versions
Message-ID: <20131105231347.742EF7F922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2fb436660c07c1d6eb0d189b1778c2e573be1b63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.11.config => linux-3.12.config}       |    0
 board/freescale/p1010rdb/readme.txt                |    2 +-
 configs/freescale_p1010rdb_defconfig               |    6 +++---
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/freescale/p1010rdb/linux-3.11.config b/board/freescale/p1010rdb/linux-3.12.config
similarity index 100%
rename from board/freescale/p1010rdb/linux-3.11.config
rename to board/freescale/p1010rdb/linux-3.12.config
diff --git a/board/freescale/p1010rdb/readme.txt b/board/freescale/p1010rdb/readme.txt
index 5b56873..42706fd 100644
--- a/board/freescale/p1010rdb/readme.txt
+++ b/board/freescale/p1010rdb/readme.txt
@@ -6,7 +6,7 @@ It won't work for NAND or SPI and will brick those bootloaders!
 Also don't go playing around with different U-boot versions or flash targets
 unless you've got the necessary hardware and/or know-how to unbrick your kit.
 
-2013.04 is known good for NOR.
+2013.10 is known good for NOR.
 ******************** WARNING ********************
 
 You'll need to program the files created by buildroot into the flash.
diff --git a/configs/freescale_p1010rdb_defconfig b/configs/freescale_p1010rdb_defconfig
index 76a0be2..0a727c4 100644
--- a/configs/freescale_p1010rdb_defconfig
+++ b/configs/freescale_p1010rdb_defconfig
@@ -11,14 +11,14 @@ BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x20000
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.5"
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.12.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="p1010rdb"
