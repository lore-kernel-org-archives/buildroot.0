Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118FAC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:10:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5CC161353
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5CC161353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FF8B402F5;
	Mon,  8 Nov 2021 22:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BK8e6Ei_FB_Z; Mon,  8 Nov 2021 22:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74771401E9;
	Mon,  8 Nov 2021 22:10:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EF581BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85DBA80EA4
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3gwUuKQvqVo for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E376480EA1
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AD82C8B70F; Mon,  8 Nov 2021 22:02:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08d938100e36cf34f66808f479c9fd8fe71d08ad
X-Git-Newrev: 2683e465d6332fded1ebcb94094eba4e6c4190de
X-Patchwork-Hint: ignore
Message-Id: <20211108220209.AD82C8B70F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/engicam/icorem6/genimage.cfg:
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

commit: https://git.buildroot.net/buildroot/commit/?id=2683e465d6332fded1ebcb94094eba4e6c4190de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/engicam/icorem6/genimage.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/engicam/icorem6/genimage.cfg b/board/engicam/icorem6/genimage.cfg
index 835d905869..985d9e5de1 100644
--- a/board/engicam/icorem6/genimage.cfg
+++ b/board/engicam/icorem6/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"imx6q-icore-ofcap12.dtb"
 		}
 	}
+
 	size = 64M
 }
 
@@ -18,7 +19,7 @@ image sdcard.img {
 	partition SPL {
 		in-partition-table = "no"
 		image = "SPL"
-		offset = 1024
+		offset = 1K
 	}
 
 	partition u-boot-dtb {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
