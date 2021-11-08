Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A48C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14E8B6124D
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14E8B6124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE5EF80F06;
	Mon,  8 Nov 2021 22:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-MeFYFHASYt; Mon,  8 Nov 2021 22:40:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49FE280F1B;
	Mon,  8 Nov 2021 22:40:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F70B1BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C4FF402C1
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrjUylXw9t_n for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0C0440370
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6BE788A47B; Mon,  8 Nov 2021 22:08:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4cbd842ef99ce89910be4700ed2c4e99a9152c26
X-Git-Newrev: 6b2232ea09b98c6cd85f16cadf3a9e3ee64467b2
X-Patchwork-Hint: ignore
Message-Id: <20211108220803.6BE788A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/stmicroelectronics/stm32f469-disco/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b2232ea09b98c6cd85f16cadf3a9e3ee64467b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/stmicroelectronics/stm32f469-disco/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/genimage.cfg b/board/stmicroelectronics/stm32f469-disco/genimage.cfg
index bc945955fa..517ead7751 100644
--- a/board/stmicroelectronics/stm32f469-disco/genimage.cfg
+++ b/board/stmicroelectronics/stm32f469-disco/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 16M
 }
 
@@ -15,7 +16,7 @@ image sdcard.img {
 
 	partition u-boot {
 		partition-type = 0xC
-                image = "boot.vfat"
+		image = "boot.vfat"
 	}
 
 	partition rootfs {
@@ -24,4 +25,3 @@ image sdcard.img {
 		size = 32M
 	}
 }
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
