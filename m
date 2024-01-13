Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0E0C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E499460F23;
	Sat, 13 Jan 2024 21:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E499460F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dt1bRUFa0YiY; Sat, 13 Jan 2024 21:16:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E9D860AEB;
	Sat, 13 Jan 2024 21:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E9D860AEB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4722F1BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBEDA60B83
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBEDA60B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhpFMs5rbO1p for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F392060E4B
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F392060E4B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0F3986064; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:49:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e3d206f154915ec86d7750bf7f846b6da412a1a
X-Git-Newrev: 329672f94a8807dc8e35bcfd4cc411eb21f22144
X-Patchwork-Hint: ignore
Message-Id: <20240113211501.E0F3986064@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_zero3: bump ARM Trusted
 Firmware to 2.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=329672f94a8807dc8e35bcfd4cc411eb21f22144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Tested-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_zero3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
index 51a6efd3ed..f4fbf86812 100644
--- a/configs/orangepi_zero3_defconfig
+++ b/configs/orangepi_zero3_defconfig
@@ -9,7 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h616"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
