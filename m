Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECFDC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:09:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B42806152A
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B42806152A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78D06401C0;
	Mon,  8 Nov 2021 22:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2lktnYjq08gX; Mon,  8 Nov 2021 22:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A31E1402AA;
	Mon,  8 Nov 2021 22:09:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 208DF1BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ACC360867
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQq-mIov4-WD for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C6796085D
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 266108B70F; Mon,  8 Nov 2021 22:02:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0df7ffd4b7d361acd38e07753cfe6a67d8ab8b64
X-Git-Newrev: 06b90e9cd0e780bab820cfdd1c6b304b92968025
X-Patchwork-Hint: ignore
Message-Id: <20211108220209.266108B70F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/beagleboneai/genimage.cfg: beautify
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

commit: https://git.buildroot.net/buildroot/commit/?id=06b90e9cd0e780bab820cfdd1c6b304b92968025
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/beagleboneai/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/beagleboneai/genimage.cfg b/board/beagleboneai/genimage.cfg
index 0bdfa64d38..8aefd76ef8 100644
--- a/board/beagleboneai/genimage.cfg
+++ b/board/beagleboneai/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"uEnv.txt"
 		}
 	}
+
 	size = 16M
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
