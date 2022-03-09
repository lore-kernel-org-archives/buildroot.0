Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B1EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 20:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DE6041845;
	Wed,  9 Mar 2022 20:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iItniG_rpfsp; Wed,  9 Mar 2022 20:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39E764174F;
	Wed,  9 Mar 2022 20:48:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 556481BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 433724051F
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwqK1ZC-O2_O for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 20:47:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C77340142
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 20:47:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C06FA839AF; Wed,  9 Mar 2022 20:39:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 21:47:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57eb983832a848dd406bf6c6403d01394bc5fc78
X-Git-Newrev: 0b058e15f5334dac93f42b92ea31525afdc2c27c
X-Patchwork-Hint: ignore
Message-Id: <20220309203930.C06FA839AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fix links to Technologic Systems web
 resources
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0b058e15f5334dac93f42b92ea31525afdc2c27c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Technologic Systems has rebranded as embeddedTS with the current
domain eventually going offline. Update web/doc URLs to correct
resource locations.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/technologic/ts4900/readme.txt  | 4 ++--
 board/technologic/ts5500/readme.txt  | 4 ++--
 board/technologic/ts7680/readme.txt  | 4 ++--
 configs/ts7680_defconfig             | 2 +-
 package/ts4900-fpga/Config.in        | 2 +-
 package/ts4900-fpga/ts4900-fpga.hash | 6 +++---
 package/ts4900-fpga/ts4900-fpga.mk   | 4 ++--
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/board/technologic/ts4900/readme.txt b/board/technologic/ts4900/readme.txt
index 679454fdeb..121e639749 100644
--- a/board/technologic/ts4900/readme.txt
+++ b/board/technologic/ts4900/readme.txt
@@ -9,7 +9,7 @@ Freescale i.MX6 Single or Quad Core ARM Cortex-A9 CPU clocked at
 1GHz. The TS-4900 features Gigabit Ethernet, SATA II Port, PCI Express
 Bus, high speed USB host and device (OTG), and microSD card.
 More details on the board here:
-   http://wiki.embeddedarm.com/wiki/TS-4900
+   https://docs.embeddedTS.com/TS-4900
 
 The TS-4900 is not currently supported by mainline Linux, so a
 Technologic Systems Linux is used based on Linux 4.1.
@@ -48,5 +48,5 @@ connector etc.
 The bootloader comes pre-flashed on the board on an SPI flash. Since
 updating the bootloader is risky and not trivial, it is not included
 in the Buildroot defconfig. Refer to
-http://wiki.embeddedarm.com/wiki/TS-4900#U-Boot for details on which
+https://docs.embeddedTS.com/TS-4900#U-Boot for details on which
 U-Boot config to use and how to flash it.
diff --git a/board/technologic/ts5500/readme.txt b/board/technologic/ts5500/readme.txt
index 1e73ab3ea1..1fe384faae 100644
--- a/board/technologic/ts5500/readme.txt
+++ b/board/technologic/ts5500/readme.txt
@@ -5,7 +5,7 @@ This document explains how to set up a basic Buildroot system for the
 Technologic Systems TS-5x00 serie of x86-based Single Board Computers.
 
 TS-5x00 Single Board Computers are based on the AMD Elan520 processor. For more
-information please have a look at http://wiki.embeddedarm.com/wiki/#AMD
+information please have a look at https://docs.embeddedTS.com/Documentation_Home#AMD
 
 The kernel configuration works for any AMD Elan520-based SBCs, but the support
 is enhanced for the TS-5500 and TS-5400 models (on-board devices registration
@@ -45,7 +45,7 @@ config, the BIOS must use Logical Block Addressing (LBA). You can do it by
 choosing "Ide 0: AUTOCONFIG, LBA" under "IDE DRIVE GEOMETRY" in the "Basic CMOS
 Configuration" screen. Also, don't forget to set the 'active' (or 'bootable')
 flag on partition 1. For details about the CMOS setup, please see:
-http://wiki.embeddedarm.com/wiki/TS-5500#System_BIOS_Setup_Screens
+https://docs.embeddedts.com/TS-5500#System_BIOS_Setup_Screens
 
 Connect a terminal program to the rs232 connector marked "COM2"
 with baudrate set to 115200, insert the Compact Flash card into the socket,
diff --git a/board/technologic/ts7680/readme.txt b/board/technologic/ts7680/readme.txt
index 43d5d135e8..3f703330bf 100644
--- a/board/technologic/ts7680/readme.txt
+++ b/board/technologic/ts7680/readme.txt
@@ -8,7 +8,7 @@ The TS-7680 SBC is based on the Freescale i.MX286 ARM ARM926EJ-S
 running at 454MHz. The TS-7680 features are 10/100 Ethernet ports,
 Wi-Fi, microSD card, eMMC, NOR Flash, USB host port, CAN ports,
 relays and ADC/DAC. More details on the board here:
-https://wiki.embeddedarm.com/wiki/TS-7680
+https://docs.embeddedTS.com/TS-7680
 
 The TS-7680 uses a 4.9 Linux kernel provided by Technologic Systems.
 
@@ -46,5 +46,5 @@ the SD jumper is present and the U-Boot jumper is not.
 The bootloader comes pre-flashed on the board on an SPI flash. Since
 updating the bootloader is risky and not trivial, it is not included
 in the Buildroot defconfig. Refer to
-https://wiki.embeddedarm.com/wiki/TS-7680#U-Boot for details on
+https://docs.embeddedts.com/TS-7680#U-Boot for details on
 which U-Boot config to use and how to flash it.
diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
index 7eb57ab1c5..e4f5c1aabd 100644
--- a/configs/ts7680_defconfig
+++ b/configs/ts7680_defconfig
@@ -4,7 +4,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/technologic/ts7680/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,embeddedarm,linux-4.9.y,d03d426e6abd95a973bc669315206295713c17e8)/linux-d03d426e6abd95a973bc669315206295713c17e8.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,embeddedTS,linux-4.9.y,d03d426e6abd95a973bc669315206295713c17e8)/linux-d03d426e6abd95a973bc669315206295713c17e8.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="ts_imx28"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
diff --git a/package/ts4900-fpga/Config.in b/package/ts4900-fpga/Config.in
index 7aa94e26f2..9f704fbc8c 100644
--- a/package/ts4900-fpga/Config.in
+++ b/package/ts4900-fpga/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_TS4900_FPGA
 	  It is loaded by U-Boot during the boot sequence, the default
 	  U-boot script expects to find it in the /boot folder.
 
-	  http://wiki.embeddedarm.com/wiki/TS-4900#FPGA_Changelog
+	  https://docs.embeddedts.com/TS-4900#FPGA_Changelog
diff --git a/package/ts4900-fpga/ts4900-fpga.hash b/package/ts4900-fpga/ts4900-fpga.hash
index 2147aeb3c2..9ffff643af 100644
--- a/package/ts4900-fpga/ts4900-fpga.hash
+++ b/package/ts4900-fpga/ts4900-fpga.hash
@@ -1,5 +1,5 @@
-# From ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-linux/fpga/ts4900-fpga-20150930.bin.md5
-md5 bf93c03ef914cf008287c8cd60781cc8  ts4900-fpga-20150930.bin
+# From https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga//ts4900-fpga-20150930.bin.md5
+md5  bf93c03ef914cf008287c8cd60781cc8  ts4900-fpga-20150930.bin
 
 # Locally calculated
-sha256 242ac6a90bea9a95c937ea8952cdc9b02f543cea24a0359bed66a408a6dd8bf9 ts4900-fpga-20150930.bin
+sha256  242ac6a90bea9a95c937ea8952cdc9b02f543cea24a0359bed66a408a6dd8bf9  ts4900-fpga-20150930.bin
diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
index 7bb62a3984..a3e42c0812 100644
--- a/package/ts4900-fpga/ts4900-fpga.mk
+++ b/package/ts4900-fpga/ts4900-fpga.mk
@@ -6,9 +6,9 @@
 
 TS4900_FPGA_VERSION = 20150930
 TS4900_FPGA_SOURCE = ts4900-fpga-$(TS4900_FPGA_VERSION).bin
-TS4900_FPGA_SITE = ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-linux/fpga
+TS4900_FPGA_SITE = https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga
 # No license file provided, Yocto recipe from the vendor claims MIT.
-# https://github.com/embeddedarm/meta-ts/blob/f31860f1204b64f765a5380d3b93a2cf18234f90/recipes-extras/ts4900-fpga/ts4900-fpga.bb#L6
+# https://github.com/embeddedTS/meta-ts/blob/f31860f1204b64f765a5380d3b93a2cf18234f90/recipes-extras/ts4900-fpga/ts4900-fpga.bb#L6
 
 define TS4900_FPGA_EXTRACT_CMDS
 	cp $(TS4900_FPGA_DL_DIR)/$(TS4900_FPGA_SOURCE) $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
