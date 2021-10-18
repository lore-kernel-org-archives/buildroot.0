Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C164FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 18:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B659061263
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 18:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B659061263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61085606FA;
	Mon, 18 Oct 2021 18:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nM4iLsBJIV_1; Mon, 18 Oct 2021 18:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAAAC6069C;
	Mon, 18 Oct 2021 18:54:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 815901BF2C8
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 18:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62C4880005
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 18:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTYINOjd2HQX for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 18:54:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FC3D82A2E
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 18:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3FAAD87161; Mon, 18 Oct 2021 18:51:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 20:54:01 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: dceae741b0e194219a511102f15fea6378aefc78
X-Git-Newrev: c030ba7c646c4b0db1ff8c458d3449c4c5513e15
X-Patchwork-Hint: ignore
Message-Id: <20211018185102.3FAAD87161@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: drop Arthur
 Courtel
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

commit: https://git.buildroot.net/buildroot/commit/?id=c030ba7c646c4b0db1ff8c458d3449c4c5513e15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

450 4.1.1 <arthur.courtel@smile.fr>: Recipient address rejected: User
unknown in virtual mailbox table

Arthur is no longer at Smile.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6df212931bafadf439a78c89dba067f15163fb64)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1105c4a039..0cea4899be 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -227,10 +227,6 @@ F:	package/python-bottle/
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
