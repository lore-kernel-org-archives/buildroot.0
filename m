Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81E9C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8684D619A6
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8684D619A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E3A480F03;
	Mon,  8 Nov 2021 22:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzLrcBW7K8nm; Mon,  8 Nov 2021 22:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDBC880EFF;
	Mon,  8 Nov 2021 22:30:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15D571BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07F0040320
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQGa29um02hJ for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C719402F4
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EA1488A47B; Mon,  8 Nov 2021 22:08:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e91402d1454c0f24b5d2bbb7e794c84a24c4b1d2
X-Git-Newrev: f00ea87bafcb75668c6abdbdb716c5e13b6e0510
X-Patchwork-Hint: ignore
Message-Id: <20211108220800.EA1488A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/friendlyarm/nanopi-neo/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=f00ea87bafcb75668c6abdbdb716c5e13b6e0510
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/friendlyarm/nanopi-neo/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
index f6adc4af3e..92af667552 100644
--- a/board/friendlyarm/nanopi-neo/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -16,8 +17,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
