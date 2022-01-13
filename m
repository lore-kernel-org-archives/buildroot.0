Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9588CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45A3184CBE;
	Thu, 13 Jan 2022 19:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3P9wauSGBJO; Thu, 13 Jan 2022 19:38:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D7C84CBB;
	Thu, 13 Jan 2022 19:38:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE361BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EDD46FC57
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYIExXAxZPS6 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:38:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A8C660A91
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 16BA48356C; Thu, 13 Jan 2022 19:32:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:38:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e2a38d38d30c9caab7da55a24f0ffacf7a19e50
X-Git-Newrev: ba46964b85b26b6c6537b6339140b353d3e0bdb3
X-Patchwork-Hint: ignore
Message-Id: <20220113193229.16BA48356C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/roseapplypi_defconfig: bump kernel
 to 5.15.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba46964b85b26b6c6537b6339140b353d3e0bdb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/roseapplepi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
index 00bdf69d8a..0f37d5dc0b 100644
--- a/configs/roseapplepi_defconfig
+++ b/configs/roseapplepi_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/roseapplepi/genimage.cfg"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.14"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/roseapplepi/linux.config"
 BR2_LINUX_KERNEL_UIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
