Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A8FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:12:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C0A26109E
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C0A26109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFE1E40466;
	Thu, 14 Oct 2021 21:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UCUlXMX3Las; Thu, 14 Oct 2021 21:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04B71400D9;
	Thu, 14 Oct 2021 21:11:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 416AD1BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EDE7400D9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3RVTGWBCdQA for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:11:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EEE5400BA
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:11:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 00CE794EBB; Thu, 14 Oct 2021 21:08:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:11:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36866eefeebceb249a7224645151a7be9ff653eb
X-Git-Newrev: 6df212931bafadf439a78c89dba067f15163fb64
X-Patchwork-Hint: ignore
Message-Id: <20211014210900.00CE794EBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop Arthur Courtel
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

commit: https://git.buildroot.net/buildroot/commit/?id=6df212931bafadf439a78c89dba067f15163fb64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

450 4.1.1 <arthur.courtel@smile.fr>: Recipient address rejected: User
unknown in virtual mailbox table

Arthur is no longer at Smile.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b1439391ca..e2a97f8b00 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -229,10 +229,6 @@ F:	package/python-bottle/
 F:	package/sqlcipher/
 F:	package/stress/
 
-N:	Arthur Courtel <arthur.courtel@smile.fr>
-F:	board/raspberrypi/genimage-raspberrypi4-64.cfg
-F:	configs/raspberrypi4_64_defconfig
-
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/collectd/
 F:	package/libfuse3/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
