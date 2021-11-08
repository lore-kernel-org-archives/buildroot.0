Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9617C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:32:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9401160041
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9401160041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E1CA4031D;
	Mon,  8 Nov 2021 22:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1WlvqWOYFbd6; Mon,  8 Nov 2021 22:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88DC5402F6;
	Mon,  8 Nov 2021 22:32:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C9E61BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F55060855
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2rWmGUVzu9X for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F49060861
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 28E588A47B; Mon,  8 Nov 2021 22:08:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0ef71d56657d38db8b5373005a8dd96f4721dec0
X-Git-Newrev: c799afd6d6f45c634be62cd75b68da97bbfa7906
X-Patchwork-Hint: ignore
Message-Id: <20211108220801.28E588A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/hardkernel/odroidc2/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=c799afd6d6f45c634be62cd75b68da97bbfa7906
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/hardkernel/odroidc2/genimage.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
index f49c1deaf3..c283b514d6 100644
--- a/board/hardkernel/odroidc2/genimage.cfg
+++ b/board/hardkernel/odroidc2/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 64M
 }
 
@@ -22,7 +23,7 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "uboot-odc2.img"
-		offset = 49664
+		offset = 49664 # 48KB + 512B
 	}
 
 	partition boot {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
