Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405EEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E04F2404F4;
	Wed, 16 Feb 2022 21:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1yHOVP-o4LVP; Wed, 16 Feb 2022 21:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9CAC40523;
	Wed, 16 Feb 2022 21:54:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E835D1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D710E415D2
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Rev2aOLVBSU for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:54:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CD20415B4
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:54:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 56C268377B; Wed, 16 Feb 2022 21:47:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:54:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a14a68a57dee2d8636e616916f48a2f721bd51fe
X-Git-Newrev: 892834535cdf27c6290a1d45fa8e03b3e1908f35
X-Patchwork-Hint: ignore
Message-Id: <20220216214708.56C268377B@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch: remove
 N/M
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

commit: https://git.buildroot.net/buildroot/commit/?id=892834535cdf27c6290a1d45fa8e03b3e1908f35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Found by check-package:
package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch:4: generate your patches with 'git format-patch -N'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch b/package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch
index e6020f466e..ea299081aa 100644
--- a/package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch
+++ b/package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch
@@ -1,7 +1,7 @@
 From bea5891591402f14940a607eafbdcd169ff8827f Mon Sep 17 00:00:00 2001
 From: Yegor Yefremov <yegorslists@googlemail.com>
 Date: Sun, 6 Feb 2022 07:12:14 +0100
-Subject: [PATCH 2/2] linux_usbfs: fix maybe-uninitialized error
+Subject: [PATCH] linux_usbfs: fix maybe-uninitialized error
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
