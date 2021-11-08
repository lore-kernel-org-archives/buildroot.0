Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E60C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:33:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ADA1619A6
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1ADA1619A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E85A3403A8;
	Mon,  8 Nov 2021 22:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UNZzyNLkbSL; Mon,  8 Nov 2021 22:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62C43403BA;
	Mon,  8 Nov 2021 22:33:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 828B11BF995
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3500640361
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7byYvRKjZpgQ for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7784B40314
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 328B48B718; Mon,  8 Nov 2021 22:08:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c799afd6d6f45c634be62cd75b68da97bbfa7906
X-Git-Newrev: 4ee0c22bae0239774def6ec6845f72c45b7c2617
X-Patchwork-Hint: ignore
Message-Id: <20211108220801.328B48B718@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/hardkernel/odroidxu4/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ee0c22bae0239774def6ec6845f72c45b7c2617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/hardkernel/odroidxu4/genimage.cfg | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/board/hardkernel/odroidxu4/genimage.cfg b/board/hardkernel/odroidxu4/genimage.cfg
index e6b85cf2fa..0a90d6be50 100644
--- a/board/hardkernel/odroidxu4/genimage.cfg
+++ b/board/hardkernel/odroidxu4/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"exynos5422-odroidxu4.dtb"
 		}
 	}
+
 	size = 32M
 }
 
@@ -17,34 +18,34 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "bl1.bin.hardkernel"
 		offset = 512
-		size = 15360
+		size = 15K
 	}
 
 	partition bl2 {
 		in-partition-table = "no"
 		image = "bl2.bin.hardkernel.720k_uboot"
-		offset = 15872
-		size = 16384
+		offset = 15872 # 15KB + 512B
+		size = 16K
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-dtb.bin"
-		offset = 32256
-		size = 720k
+		offset = 32256 # 31KB + 512B
+		size = 720K
 	}
 
 	partition tzsw {
 		in-partition-table = "no"
 		image = "tzsw.bin.hardkernel"
-		offset = 769536
-		size = 256k
+		offset = 769536 # 751KB + 512B
+		size = 256K
 	}
 
 	partition vfat {
 		partition-type = 0xC
 		image = "boot.vfat"
-		offset = 2097152
+		offset = 2M
 	}
 
 	partition rootfs {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
