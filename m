From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 May 2013 11:48:01 -0300
Subject: [Buildroot] [PATCH] board/freescale: switch to u-boot 2013.04
Message-ID: <1367851681-12228-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/freescale/mpc8315erdb/readme.txt  | 2 +-
 board/freescale/p1010rdb/readme.txt     | 2 +-
 configs/freescale_mpc8315erdb_defconfig | 2 +-
 configs/freescale_p1010rdb_defconfig    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/freescale/mpc8315erdb/readme.txt b/board/freescale/mpc8315erdb/readme.txt
index 91e58e4..f7f9c94 100644
--- a/board/freescale/mpc8315erdb/readme.txt
+++ b/board/freescale/mpc8315erdb/readme.txt
@@ -6,7 +6,7 @@ It won't work for NOR and will brick that bootloader!
 Also don't go playing around with different U-boot versions or flash targets
 unless you've got the necessary hardware and/or know-how to unbrick your kit.
 
-2012.10 is known good for NAND.
+2013.04 is known good for NAND.
 ******************** WARNING ********************
 
 You'll need to program the files created by buildroot into the flash.
diff --git a/board/freescale/p1010rdb/readme.txt b/board/freescale/p1010rdb/readme.txt
index 96293b7..5b56873 100644
--- a/board/freescale/p1010rdb/readme.txt
+++ b/board/freescale/p1010rdb/readme.txt
@@ -6,7 +6,7 @@ It won't work for NAND or SPI and will brick those bootloaders!
 Also don't go playing around with different U-boot versions or flash targets
 unless you've got the necessary hardware and/or know-how to unbrick your kit.
 
-2012.10 is known good for NOR, but BAD for NAND and SPI.
+2013.04 is known good for NOR.
 ******************** WARNING ********************
 
 You'll need to program the files created by buildroot into the flash.
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index 9f733fa..88e0d8a 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -30,4 +30,4 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="MPC8315ERDB_NAND"
-BR2_TARGET_UBOOT_2012_10=y
+BR2_TARGET_UBOOT_2013_04=y
diff --git a/configs/freescale_p1010rdb_defconfig b/configs/freescale_p1010rdb_defconfig
index a36f07c..8887636 100644
--- a/configs/freescale_p1010rdb_defconfig
+++ b/configs/freescale_p1010rdb_defconfig
@@ -29,4 +29,4 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="P1010RDB_NOR"
-BR2_TARGET_UBOOT_2012_10=y
+BR2_TARGET_UBOOT_2013_04=y
-- 
1.8.1.5
