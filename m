Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D2DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:09:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6250861506
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6250861506
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE504037F;
	Mon,  8 Nov 2021 22:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtLT5S7ym_vW; Mon,  8 Nov 2021 22:09:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B5A440379;
	Mon,  8 Nov 2021 22:09:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4380C1BF9A4
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6DAE4034E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTLMh_2tWSwX for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AA664034A
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BC1358B708; Mon,  8 Nov 2021 22:02:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d058d61c56eada8ea6ed090b9c9bb62249fd8338
X-Git-Newrev: 044903594f43a12fad18cb17c465b137b955303f
X-Patchwork-Hint: ignore
Message-Id: <20211108220210.BC1358B708@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 board/microchip/sam9x60ek_mmc/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=044903594f43a12fad18cb17c465b137b955303f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/microchip/sam9x60ek_mmc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/microchip/sam9x60ek_mmc/genimage.cfg b/board/microchip/sam9x60ek_mmc/genimage.cfg
index c41581091e..629caf3ef7 100644
--- a/board/microchip/sam9x60ek_mmc/genimage.cfg
+++ b/board/microchip/sam9x60ek_mmc/genimage.cfg
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
