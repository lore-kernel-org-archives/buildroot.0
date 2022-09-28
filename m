Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9153EC04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 07:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2665A81801;
	Wed, 28 Sep 2022 07:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2665A81801
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fHadmD3Rfl2Z; Wed, 28 Sep 2022 07:04:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5663D81770;
	Wed, 28 Sep 2022 07:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5663D81770
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62D6F1BF8C7
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 07:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E91B40587
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 07:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E91B40587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9TcbvQbWkCkM for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 07:04:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5915D4057F
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 07:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5915D4057F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46BB486409; Wed, 28 Sep 2022 07:04:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Sep 2022 09:04:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6b987f39ddd2abbce526021ccb39bd42e50fa23
X-Git-Newrev: e4ecf82f99f53e55d51e6f74ae5021473aa2bb1d
X-Patchwork-Hint: ignore
Message-Id: <20220928070417.46BB486409@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Nicolas Tran
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e4ecf82f99f53e55d51e6f74ae5021473aa2bb1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nicolas Tran is apparently no longer at Smile:

The response from the remote server was:
450 4.1.1 <nicolas.tran@smile.fr>: Recipient address rejected: User unknown in virtual mailbox table

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index eceb44ca86..59121c6a54 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2221,10 +2221,6 @@ N:	Nicolas Serafini <nicolas.serafini@ik.me>
 F:	package/exiv2/
 F:	package/ofono/
 
-N:	Nicolas Tran <nicolas.tran@smile.fr>
-F:	package/dust/
-F:	package/hyperfine/
-
 N:	Niklas Cassel <niklas.cassel@wdc.com>
 F:	configs/qemu_riscv64_nommu_virt_defconfig
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
