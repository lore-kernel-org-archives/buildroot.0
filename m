Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FCAC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:19:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A39E0613A6
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A39E0613A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CDD880E63;
	Mon,  8 Nov 2021 22:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCgdoz4PbMOm; Mon,  8 Nov 2021 22:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D867780DF4;
	Mon,  8 Nov 2021 22:19:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 121581BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A02B660871
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFzsbrzgvK4g for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFD9660874
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AD4D58B70F; Mon,  8 Nov 2021 22:02:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 317ba296eb3e42363adad710ac3c00d45d08bf2c
X-Git-Newrev: 8eb94081de2bbfa6320be8d0d2217ce0bce1d377
X-Patchwork-Hint: ignore
Message-Id: <20211108220211.AD4D58B70F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/pandaboard/genimage.cfg: beautify
 file
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

commit: https://git.buildroot.net/buildroot/commit/?id=8eb94081de2bbfa6320be8d0d2217ce0bce1d377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/pandaboard/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/pandaboard/genimage.cfg b/board/pandaboard/genimage.cfg
index f30033f023..dfe388227e 100644
--- a/board/pandaboard/genimage.cfg
+++ b/board/pandaboard/genimage.cfg
@@ -5,6 +5,7 @@ image boot.vfat {
 			"u-boot.img"
 		}
 	}
+
 	size = 8M
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
