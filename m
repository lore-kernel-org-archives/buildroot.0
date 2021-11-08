Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BD6C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:27:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C196661994
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C196661994
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D02840392;
	Mon,  8 Nov 2021 22:27:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sYsh-jjP0Ew2; Mon,  8 Nov 2021 22:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3BFF40388;
	Mon,  8 Nov 2021 22:27:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10DAC1BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B925D40361
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xm7PWdoFya0e for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C7A340314
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CB4058A47B; Mon,  8 Nov 2021 22:07:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:20:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2b2da9381cd920fb91b1fd75e735d570a6b736e9
X-Git-Newrev: 855ad130e4790ca6a65ec5f0f03f42fde20da9e1
X-Patchwork-Hint: ignore
Message-Id: <20211108220759.CB4058A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/atmel/sama5d2_xplained_mmc/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=855ad130e4790ca6a65ec5f0f03f42fde20da9e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/atmel/sama5d2_xplained_mmc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/atmel/sama5d2_xplained_mmc/genimage.cfg b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
index 3cc8ae2f8c..2c5a0f6dce 100644
--- a/board/atmel/sama5d2_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
@@ -9,6 +9,7 @@ image boot.vfat {
 			"u-boot.bin"
 		}
 	}
+
 	size = 16M
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
