Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E751C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:19:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B67461B95
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B67461B95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C0B80D99;
	Wed, 17 Nov 2021 22:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSEjaydIgiW4; Wed, 17 Nov 2021 22:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DD5780D1D;
	Wed, 17 Nov 2021 22:19:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22FC61BF9BA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 113E040602
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hR6zZye3h3je for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:19:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37EF1405CB
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:19:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1CD018D64E; Wed, 17 Nov 2021 22:15:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:05:31 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 702a1cac07d50fb8bcb1a5b73883622da86a3eb4
X-Git-Newrev: 8d41edbf29c84c71cf6bf39bfaa9a7c584266e84
X-Patchwork-Hint: ignore
Message-Id: <20211117221505.1CD018D64E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] DEVELOPERS: add Joachim
 Wiberg as co-maintainer of SMCRoute
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d41edbf29c84c71cf6bf39bfaa9a7c584266e84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Add myself as co-maintainer of SMCRoute in Buildroot, handy since I'm
the upstream maintainer anyway.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 96e2fccd9c6d87920c280570e0183e5eda7c4fac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 33ceaa05dd..a8098f37a4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1331,6 +1331,7 @@ F:	package/libuev/
 F:	package/mg/
 F:	package/mrouted/
 F:	package/netcalc/
+F:	package/smcroute/
 F:	package/ssdp-responder/
 F:	package/sysklogd/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
