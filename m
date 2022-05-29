Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30854C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A84F3426BD;
	Sun, 29 May 2022 08:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nLnIGN3ARPF; Sun, 29 May 2022 08:30:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB3FF4266B;
	Sun, 29 May 2022 08:30:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AF641BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED9F24266A
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:29:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86oBx7nl9clG for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:29:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDC974266B
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:29:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 68D5986499; Sun, 29 May 2022 08:18:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 10:28:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2cef41ff988c273f52d3598449e829a9556e354
X-Git-Newrev: c86318e921d5dddf17340f02ba19b685f8786dd7
X-Patchwork-Hint: ignore
Message-Id: <20220529081827.68D5986499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rockchip-mali: fix typo on
 Config.in help section
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

commit: https://git.buildroot.net/buildroot/commit/?id=c86318e921d5dddf17340f02ba19b685f8786dd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rockchip-mali/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rockchip-mali/Config.in b/package/rockchip-mali/Config.in
index 2a8cd786be..d616284911 100644
--- a/package/rockchip-mali/Config.in
+++ b/package/rockchip-mali/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_ROCKCHIP_MALI
 	select BR2_PACKAGE_MALI_DRIVER if BR2_LINUX_KERNEL
 	help
 	  Install the binary user-space libraries for the ARM Mali GPU
-	  suitable for Rockchip platforrms. This package requires a
+	  suitable for Rockchip platforms. This package requires a
 	  kernel with the ARM Mali GPU kernel driver enabled, as found
 	  in the 'mali-driver' package.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
