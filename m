Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D60E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 15:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAEBD4069A;
	Wed, 11 Dec 2024 15:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Aj9o9rZ-Ply; Wed, 11 Dec 2024 15:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB989406AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB989406AF;
	Wed, 11 Dec 2024 15:49:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 716EC962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C5E3406AF
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yx9WL795nmjj for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 15:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9162F4069A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9162F4069A
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:49:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78E7486D20; Wed, 11 Dec 2024 15:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 16:46:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f6a924fa8e1a1b5d94acd5529eeb7feb9af94e5
X-Git-Newrev: dcb4d360eceb3c6f66dbee54759326ec7541b632
X-Patchwork-Hint: ignore
Message-Id: <20241211154920.78E7486D20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/cubietech/cubieboard1: use lowercase
 keywords in extlinux.conf file
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
