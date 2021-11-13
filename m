Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC6FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:03:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9923D60F6B
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9923D60F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72B89402FE;
	Sat, 13 Nov 2021 17:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6w3letIqeFY; Sat, 13 Nov 2021 17:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0E59402BD;
	Sat, 13 Nov 2021 17:03:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26F4D1BF299
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24942402BD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kesapp5fumsV for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:03:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BE9740296
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:03:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2594C8C9F7; Sat, 13 Nov 2021 16:59:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:03:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9dfe03df0d951935f135cc9335fe54f964482480
X-Git-Newrev: 96e2fccd9c6d87920c280570e0183e5eda7c4fac
X-Patchwork-Hint: ignore
Message-Id: <20211113165904.2594C8C9F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Joachim Wiberg as
 co-maintainer of SMCRoute
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

commit: https://git.buildroot.net/buildroot/commit/?id=96e2fccd9c6d87920c280570e0183e5eda7c4fac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add myself as co-maintainer of SMCRoute in Buildroot, handy since I'm
the upstream maintainer anyway.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 70262eac8c..b190c0f356 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1349,6 +1349,7 @@ F:	package/libuev/
 F:	package/mg/
 F:	package/mrouted/
 F:	package/netcalc/
+F:	package/smcroute/
 F:	package/ssdp-responder/
 F:	package/sysklogd/
 F:	package/watchdogd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
