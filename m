Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB60C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:07:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1FE661054
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1FE661054
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B8B6402DC;
	Mon,  8 Nov 2021 22:07:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Afzo7OZr31Du; Mon,  8 Nov 2021 22:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8EA0401E9;
	Mon,  8 Nov 2021 22:07:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5AE1BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97236607F5
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGl9do6mPxvI for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 061B260855
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B5A098B70F; Mon,  8 Nov 2021 22:02:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:20:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15d8d81db37246fc681dafe6f2659cb902dc87ce
X-Git-Newrev: 60a825bfea3664b4222153a1af983b8507a2b758
X-Patchwork-Hint: ignore
Message-Id: <20211108220208.B5A098B70F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/amarula/a64-relic/genimage.cfg:
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

commit: https://git.buildroot.net/buildroot/commit/?id=60a825bfea3664b4222153a1af983b8507a2b758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/amarula/a64-relic/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/amarula/a64-relic/genimage.cfg b/board/amarula/a64-relic/genimage.cfg
index 002b6bb4d1..58b607f5fb 100644
--- a/board/amarula/a64-relic/genimage.cfg
+++ b/board/amarula/a64-relic/genimage.cfg
@@ -6,5 +6,6 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 64M
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
