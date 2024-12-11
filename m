Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF18C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81AC94AEE1;
	Fri, 28 Feb 2025 16:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17rlz4RTvsRz; Fri, 28 Feb 2025 16:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5174D49832
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5174D49832;
	Fri, 28 Feb 2025 16:30:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9951468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8610840469
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdA_CeNwzDjW for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59D5B40413
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59D5B40413
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4933886D17; Fri, 28 Feb 2025 16:29:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 16:46:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4f6a924fa8e1a1b5d94acd5529eeb7feb9af94e5
X-Git-Newrev: dcb4d360eceb3c6f66dbee54759326ec7541b632
X-Patchwork-Hint: ignore
Message-Id: <20250228162937.4933886D17@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/cubietech/cubieboard1:
 use lowercase keywords in extlinux.conf file
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dcb4d360eceb3c6f66dbee54759326ec7541b632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit also updates the label name, and the unnecessary "default"
entry is also removed.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf       | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf b/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
index 2fde683f38..5b071dce84 100644
--- a/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
+++ b/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -1,5 +1,4 @@
-DEFAULT linux
-LABEL linux
-  KERNEL /boot/zImage
-  DEVICETREE /boot/sun4i-a10-cubieboard.dtb
-  APPEND console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
+label cubieboard-buildroot
+  kernel /boot/zImage
+  devicetree /boot/sun4i-a10-cubieboard.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
