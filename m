Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB96C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:25:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C8861502
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9C8861502
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3BE84036E;
	Mon,  8 Nov 2021 22:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3F7smtLhbis; Mon,  8 Nov 2021 22:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 210B740390;
	Mon,  8 Nov 2021 22:25:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 118011BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 620A680E8A
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5egTDnqXLWSZ for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10C3B80EDF
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C122F8B70F; Mon,  8 Nov 2021 22:02:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb8c35fcd53945c8aacb8a6d02d2ad72ec71805e
X-Git-Newrev: 2cfed9b4f710169068582b674ecccbc253b183e4
X-Patchwork-Hint: ignore
Message-Id: <20211108220212.C122F8B70F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/toradex/apalis-imx6/genimage.cfg:
 beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cfed9b4f710169068582b674ecccbc253b183e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/toradex/apalis-imx6/genimage.cfg | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/board/toradex/apalis-imx6/genimage.cfg b/board/toradex/apalis-imx6/genimage.cfg
index fe359bd93e..a277decaa8 100644
--- a/board/toradex/apalis-imx6/genimage.cfg
+++ b/board/toradex/apalis-imx6/genimage.cfg
@@ -4,12 +4,12 @@
 # from its internal flash memory (eMMC).
 
 image sdcard.img {
-  hdimage {
-  }
+	hdimage {
+	}
 
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext2"
-    size = 512M
-  }
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 512M
+	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
