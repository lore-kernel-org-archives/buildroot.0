Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DE1C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:38:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 682B86124D
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 682B86124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39D8640320;
	Mon,  8 Nov 2021 22:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6WTYa_r2D2c; Mon,  8 Nov 2021 22:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01F4B4031F;
	Mon,  8 Nov 2021 22:38:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9470E1BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B911E402F4
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LG5knQSI2kSz for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08D2740333
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B687D8B719; Mon,  8 Nov 2021 22:08:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 95d1d6bf8780da12aa2e284ff0eb1d6c9d18d32f
X-Git-Newrev: 542ad8226c951c4b517a3079e804fbd3ad282efc
X-Patchwork-Hint: ignore
Message-Id: <20211108220802.B687D8B719@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/radxa/rockpi-n10/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=542ad8226c951c4b517a3079e804fbd3ad282efc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/radxa/rockpi-n10/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rockpi-n10/genimage.cfg b/board/radxa/rockpi-n10/genimage.cfg
index 8fbf562f28..b3ade327d6 100644
--- a/board/radxa/rockpi-n10/genimage.cfg
+++ b/board/radxa/rockpi-n10/genimage.cfg
@@ -6,11 +6,11 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 112M
 }
 
 image sdcard.img {
-
 	hdimage {
 		gpt = true
 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
