Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229D8C6FA8F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 20:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB6624168D;
	Thu, 24 Aug 2023 20:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB6624168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNSq7aKuElDS; Thu, 24 Aug 2023 20:33:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 293CD41667;
	Thu, 24 Aug 2023 20:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 293CD41667
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5ED2D1BF27E
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3730341741
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3730341741
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nv1IeFTNvdkG for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 20:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BDC841722
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 20:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BDC841722
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02E4E86265; Thu, 24 Aug 2023 20:33:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 22:33:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d1c32c703bb730da2db7facf35c186fb1a6fe331
X-Git-Newrev: 037133271495159ccaeed9e9d53c4829b164ea9e
X-Patchwork-Hint: ignore
Message-Id: <20230824203325.02E4E86265@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/orangepi_pc2: bump
 U-Boot version to 2023.04
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=037133271495159ccaeed9e9d53c4829b164ea9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_pc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 29939ea1fb..46d04b34c8 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
