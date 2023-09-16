Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED0ECD37B2
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 07:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90C314032B;
	Sat, 16 Sep 2023 07:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90C314032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IoleKddZfn3; Sat, 16 Sep 2023 07:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3F6A4023F;
	Sat, 16 Sep 2023 07:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3F6A4023F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0858F1BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 07:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2D7E60BC3
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 07:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2D7E60BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WStePBSL22RQ for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 07:01:19 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD80D60BA1
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 07:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD80D60BA1
X-Virus-Scanned: by amavisd-new using ClamAV (3)
Received: from zm.lan (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id D9B891BC0F8;
 Sat, 16 Sep 2023 09:01:16 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 09:01:11 +0200
Message-ID: <20230916070111.2982780-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/orangepi_zero_plus: bump
 ATF/U-Boot/Linux
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 configs/orangepi_zero_plus_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
index 26a25bd9f8..c564d8a342 100644
--- a/configs/orangepi_zero_plus_defconfig
+++ b/configs/orangepi_zero_plus_defconfig
@@ -9,7 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
@@ -17,7 +17,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07.02"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.53"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus"
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
