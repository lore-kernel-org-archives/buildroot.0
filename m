Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E6CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:22:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D15C60232
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D15C60232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20F6E80ED1;
	Mon,  8 Nov 2021 22:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DrXsyDfTudR; Mon,  8 Nov 2021 22:22:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71AC980ECF;
	Mon,  8 Nov 2021 22:22:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7361BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECB8780EAA
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a7-vbCKZyPfk for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF25D80E9D
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8C0948B711; Mon,  8 Nov 2021 22:02:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 543b8e906dfebc133c6afe77bb6e43b3d41d9d58
X-Git-Newrev: dff14af0c62084e44aae3679a70d390c0255f68d
X-Patchwork-Hint: ignore
Message-Id: <20211108220209.8C0948B711@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 board/altera/socrates_cyclone5/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=dff14af0c62084e44aae3679a70d390c0255f68d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/altera/socrates_cyclone5/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/altera/socrates_cyclone5/genimage.cfg b/board/altera/socrates_cyclone5/genimage.cfg
index 63fef8ba47..0af3f2ec60 100644
--- a/board/altera/socrates_cyclone5/genimage.cfg
+++ b/board/altera/socrates_cyclone5/genimage.cfg
@@ -5,6 +5,7 @@ image boot.vfat {
 			"socfpga_cyclone5_socrates.dtb"
 		}
 	}
+
 	size = 8M
 }
 
@@ -17,7 +18,7 @@ image uboot.img {
 		in-partition-table = "no"
 		image = "u-boot-spl.bin.crc"
 		offset = 0
-		size = 64k
+		size = 64K
 	}
 
 	partition uboot-full {
@@ -36,7 +37,7 @@ image sdcard.img {
 	partition uboot-env {
 		in-partition-table = "no"
 		image = "uboot-env.bin"
-		offset = 17408 # 512 * 34 -> just after gpt
+		offset = 17K # 512 * 34 -> just after gpt
 	}
 
 	partition boot {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
