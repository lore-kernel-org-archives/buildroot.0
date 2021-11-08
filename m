Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36848C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:27:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2A0600CD
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE2A0600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C902660870;
	Mon,  8 Nov 2021 22:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hsfDwf0rtdO; Mon,  8 Nov 2021 22:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 448D56085F;
	Mon,  8 Nov 2021 22:27:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 612DD1BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ABB04035F
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2W7jpQC9J26W for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C634D402C1
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7D9A581DFC; Mon,  8 Nov 2021 22:07:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:20:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7ad6b54469a52e8342fc1f2f4538933967d7ecec
X-Git-Newrev: 103ceb8d673111feb6ff1a8374b00bb627663ebe
X-Patchwork-Hint: ignore
Message-Id: <20211108220759.7D9A581DFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/acmesystems/acqua-a5/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=103ceb8d673111feb6ff1a8374b00bb627663ebe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/acmesystems/acqua-a5/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/acmesystems/acqua-a5/genimage.cfg b/board/acmesystems/acqua-a5/genimage.cfg
index 63b003f378..7fa0a69c4a 100644
--- a/board/acmesystems/acqua-a5/genimage.cfg
+++ b/board/acmesystems/acqua-a5/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"at91-sama5d3_acqua.dtb"
 		}
 	}
+
 	size = 16M
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
