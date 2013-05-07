From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 09:30:27 +0200
Subject: [Buildroot] [git commit] configs: use new u-boot custom version
	option
Message-ID: <20130507073143.261318B768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a6b7aa8d1f8765deb21ca01284029e33a7635cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/beaglebone_defconfig            |    3 ++-
 configs/freescale_mpc8315erdb_defconfig |    3 ++-
 configs/freescale_p1010rdb_defconfig    |    3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 8eeed77..2177068 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -21,7 +21,8 @@ BR2_DEFAULT_KERNEL_VERSION="3.2.9"
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
-BR2_TARGET_UBOOT_2013_04=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.04"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index 88e0d8a..d32264e 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -30,4 +30,5 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="MPC8315ERDB_NAND"
-BR2_TARGET_UBOOT_2013_04=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.04"
diff --git a/configs/freescale_p1010rdb_defconfig b/configs/freescale_p1010rdb_defconfig
index 8887636..9ee541f 100644
--- a/configs/freescale_p1010rdb_defconfig
+++ b/configs/freescale_p1010rdb_defconfig
@@ -29,4 +29,5 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="P1010RDB_NOR"
-BR2_TARGET_UBOOT_2013_04=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.04"
