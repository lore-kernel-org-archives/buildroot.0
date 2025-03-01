Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D981C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 17:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3CAD849D9;
	Sat,  1 Mar 2025 17:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EerxLvRPZJLJ; Sat,  1 Mar 2025 17:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7B9A849DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7B9A849DD;
	Sat,  1 Mar 2025 17:15:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ABE31181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 17:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9099A60B89
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 17:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlrQT1-q536y for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 17:15:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F023605A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F023605A9
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 17:15:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D94787D80; Sat,  1 Mar 2025 17:15:27 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Mar 2025 17:28:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9a7a729b45bf28ac1a5212f6bfd40311f0a96e49
X-Git-Newrev: ca24f2d6d8309d9f6fc5e4af74324f7eae158b5a
X-Patchwork-Hint: ignore
Message-Id: <20250301171527.8D94787D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/freescale_imx8dxlevk:
 bump BSP components to lf-6.6.52-2.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca24f2d6d8309d9f6fc5e4af74324f7eae158b5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.52-2.2.0
versions.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash          | 2 +-
 board/freescale/imx8dxlevk/patches/linux/linux.hash                 | 2 +-
 board/freescale/imx8dxlevk/patches/uboot/uboot.hash                 | 2 +-
 configs/freescale_imx8dxlevk_defconfig                              | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 0266b45d6a..58100572e4 100644
--- a/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  37f0dee8b3b52d6c7f8a46c3bdd4138b528f9cc607015400e7cad0c206df41d7  imx-atf-lf-6.6.23-2.0.0.tar.gz
+sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx8dxlevk/patches/linux/linux.hash b/board/freescale/imx8dxlevk/patches/linux/linux.hash
index 3c4223976b..620a7377ef 100644
--- a/board/freescale/imx8dxlevk/patches/linux/linux.hash
+++ b/board/freescale/imx8dxlevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx8dxlevk/patches/uboot/uboot.hash b/board/freescale/imx8dxlevk/patches/uboot/uboot.hash
index 4e0d729ca0..4b763ba3ba 100644
--- a/board/freescale/imx8dxlevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx8dxlevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/configs/freescale_imx8dxlevk_defconfig b/configs/freescale_imx8dxlevk_defconfig
index 1ee1413eb0..c3017074c9 100644
--- a/configs/freescale_imx8dxlevk_defconfig
+++ b/configs/freescale_imx8dxlevk_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8dxl-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8dxl-evk"
@@ -24,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8dxl"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8dxl_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
